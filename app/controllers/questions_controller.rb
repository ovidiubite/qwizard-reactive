class QuestionsController < ApplicationController
  before_action :set_quiz
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new

    @question.quiz_id = @quiz.id
    @question.points  = 100
    @question.order   = (@quiz.questions.pluck(:order).max.presence || 0) + 1
    @question.answers = 4.times.map { Answer.new }
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
