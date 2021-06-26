class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    user = User.find_by(session_params)

    if user
      session[:user_id] = user.id
      redirect_to quizzes_path
    else
      redirect_to new_password_path, error: 'Wrong username or password.'
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
