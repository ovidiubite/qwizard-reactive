class LobbiesController < ApplicationController
  skip_before_action :authenticate, only: %i[show pregame join answer]
  before_action :set_lobby, only: %i[show edit]
  before_action :set_current_player, only: %i[show edit]

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
    @lobby = Lobby.find_by(id: params[:lobby_id])
    set_current_player

    StartGame.new(lobby_id: params[:lobby_id]).call
  end

  # GET /lobbies/1
  def show
    @question_index  = @lobby.current_question_index
    @total_questions = @lobby.quiz.questions.count
  end

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
      set_current_player
      @current_player.update(:game_state, :pending)
    end

    redirect_to @lobby, notice: "Lobby was successfully created."
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Lobby was not successfully created.'
    render_flash
  end

  def pregame; end

  def join
    @lobby = Lobby.find(params[:lobby_id])

    session[:player_id] = JoinGame.new(@lobby, player_params).call
    set_current_player

    @current_player.update(:game_state, :pregame)

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

  def set_current_player
    @current_player = @lobby.players.find_by(id: session[:player_id])
  end
end
