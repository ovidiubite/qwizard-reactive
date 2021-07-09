class LobbiesController < ApplicationController
  skip_before_action :authenticate, only: %i[show pregame join answer]
  before_action :set_lobby, only: %i[show edit update destroy]

  def index
    @lobbies = current_user.quizzes
  end

  def finished
    @lobbies = current_user.lobbies.finished.joins(:quiz)

    render :index
  end

  def answer
    player = Player.find_by(id: session[:player_id])

    return head :not_found if player.blank?

    @lobby = Lobby.find(params[:lobby_id])
    question = @lobby.quiz.questions.find_by(order: @lobby.current_question_index)

    create_player_answers(player, question)

    notify_answer_count(@lobby)

    if answered_correct?(question.answers)
      flash[:notice] = "Correct! +#{question.points}"
    else
      flash[:error] = 'Wrong'
    end

    @answers = question.answers
    @player_id = player.id
  end

  def answered_correct?(answers)
    answers.where(is_correct: true).map(&:id).sort == params[:answers].map(&:to_i).sort
  end

  def start
    StartGame.new(lobby_id: params[:lobby_id]).call
  end

  # GET /lobbies/1
  def show; end

  # GET /lobbies/new
  def new
    @lobby = Lobby.new
  end

  # GET /lobbies/1/edit
  def edit
  end

  # POST /lobbies or /lobbies.json
  def create
    @lobby = Lobby.new(lobby_params.merge(code: SecureRandom.alphanumeric(6), status: 'pending'))
    @player_master = Player.new(name: current_user.username, hat: current_user.hat, lobby: @lobby)

    ActiveRecord::Base.transaction do
      @lobby.save!
      @player_master.save!
      session[:player_id] = @player_master.id
    end

    redirect_to @lobby, notice: "Lobby was successfully created."
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Lobby was not successfully created.'
    render_flash
  end

  # PATCH/PUT /lobbies/1 or /lobbies/1.json
  def update
    respond_to do |format|
      if @lobby.update(lobby_params)
        format.html { redirect_to @lobby, notice: "Lobby was successfully updated." }
        format.json { render :show, status: :ok, location: @lobby }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lobbies/1 or /lobbies/1.json
  def destroy
    @lobby.destroy
    respond_to do |format|
      format.html { redirect_to lobbies_url, notice: "Lobby was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pregame;end

  def join
    @lobby = Lobby.find(params[:lobby_id])

    session[:player_id] = JoinGame.new(@lobby, player_params).call

    redirect_to lobby_path(@lobby.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lobby_params
      params.permit(:code, :quiz_id)
    end

  def player_params
    params.require(:player).permit(:name, :hat)
  end

  def create_player_answers(player, question)
    PlayerAnswer.where(player: player, answer_id: question.answers.map(&:id)).destroy_all

    params[:answers].each do |id|
      answer = Answer.find(id)
      PlayerAnswer.create(player: player, answer: answer)
    end
  end

  def notify_answer_count(lobby)
    players = lobby.players.to_a.select do |p|
      p.player_answers.any? { |pa| pa.answer.question.order == lobby.current_question_index }
    end

    Turbo::StreamsChannel.broadcast_stream_to(
      lobby, Lobby::ANSWER_SENT,
      content: ApplicationController.render(
        :turbo_stream,
        partial: 'lobbies/update_counter',
        locals: { answer_count: players.count }
      )
    )
  end
end
