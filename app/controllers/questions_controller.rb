class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: %i[ show edit update destroy ]

  def suggest_question
    suggestion = SuggestQuestion.new.call

    question_suggestion = suggestion[:question]
    answers_suggestion = suggestion[:answers]

    if params[:question_id]
      @question = Question.find(params[:question_id])
      @question.assign_attributes(
        {
          title: question_suggestion.title,
          time_limit: question_suggestion.time_limit,
          points: question_suggestion.points,
          answer_type: question_suggestion.answer_type
        }
      )
      @question.id = params[:question_id]

      @answers = @question.answers
      @answers.map.with_index do |answer, index|
        answer.assign_attributes(
          {
            title: answers_suggestion[index].title,
            is_correct: answers_suggestion[index].is_correct
          }
        )
      end
    else
      @question = question_suggestion
      @question.quiz_id = @quiz.id
      @question.order = (@quiz.questions.pluck(:order).max.presence || 0) + 1
      @question.answers = answers_suggestion
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('question_details', partial: 'questions/suggest_question') }
      format.html { render params[:question_id] ? :edit : :new }
    end
  end

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.empty_question(@quiz)
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.turbo_stream
        format.html { redirect_to new_quiz_question_path(@quiz) }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity, notice: @question.errors.full_messages }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.turbo_stream
        format.html { redirect_to quiz_question_path(@quiz, @question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity, notice: @question.errors.full_messages }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to new_quiz_question_path(@quiz), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question)
          .permit(:title, :time_limit, :points, :answer_type, :order, :quiz_id, :image,
                  answers_attributes: [:id, :title, :is_correct])
  end
end
