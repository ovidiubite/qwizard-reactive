class LobbiesController < ApplicationController
  before_action :set_lobby, only: %i[show edit update destroy]

  def index
    # @lobbies = current_user.lobbies.active
    @lobbies = Quiz.all
  end

  def finished
    # @lobbies = current_user.lobbies.finished.joins(:quiz)
    @lobbies = Quiz.all

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
    @lobby = Lobby.new(lobby_params)

    respond_to do |format|
      if @lobby.save
        format.html { redirect_to @lobby, notice: "Lobby was successfully created." }
        format.json { render :show, status: :created, location: @lobby }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lobby_params
      params.require(:lobby).permit(:code, :status, :current_question_index)
    end
end
