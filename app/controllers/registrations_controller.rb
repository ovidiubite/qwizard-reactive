class RegistrationsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    user = User.new(users_params)

    if user.save
      session[:user_id] = user.id
      redirect_to quizzes_path, success: 'You have successfully created your account.'
    else
      render :new, error: user.errors.full_messages
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :username, :password)
  end
end
