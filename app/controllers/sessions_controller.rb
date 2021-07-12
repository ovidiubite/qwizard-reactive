class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    user = User.find_by(session_params)
    @lobby = Lobby.find_by(code_params)

    if @lobby
      redirect_to lobby_pregame_path(lobby_id: @lobby)
    elsif user
      session[:user_id] = user.id
      redirect_to lobbies_path
    else
      flash[:alert] = 'Wrong username or password.'
      render_flash
    end
  end

  def logout
    reset_session

    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

  def code_params
    params.require(:user).permit(:code)
  end
end
