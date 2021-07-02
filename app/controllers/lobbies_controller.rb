class LobbiesController < ApplicationController
  skip_before_action :authenticate, only: %i[show pregame join]
  before_action :set_lobby, only: %i[show edit update destroy]

  def index
    @lobbies = current_user.quizzes
  end

  def finished
    @lobbies = current_user.lobbies.finished.joins(:quiz)

    render :index
  end

  # GET /lobbies/1 or /lobbies/1.json
  def show
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

    respond_to do |format|
      ActiveRecord::Base.transaction do
        @lobby.save!
        @player_master.save!
      end
        format.html { redirect_to @lobby, notice: "Lobby was successfully created." }
        format.json { render :show, status: :created, location: @lobby }
      rescue ActiveRecord::RecordInvalid
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
    end
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
    params[:player][:hat] = params[:player][:hat].to_i
    @lobby = Lobby.find(params[:lobby_id])

    JoinGame.new(@lobby, player_params).call

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
end
