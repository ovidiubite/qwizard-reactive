class PasswordsController < ApplicationController
  skip_before_action :authenticate

  def new; end

  def create
    user = User.find_by(email: password_params[:email])

    redirect_to new_password_path and return if user.nil?

    user.update!(recovery_token: SecureRandom.alphanumeric(16))

    PasswordsMailer.with(user: user).recovery_token.deliver_now
    redirect_to edit_password_path(user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find_by(recovery_token: password_params[:recovery_token])

    redirect_to new_session_path and return if user.nil?

    user.update!(recovery_token: nil, password: SecureRandom.alphanumeric(16))

    PasswordsMailer.with(user: user).recover_password.deliver_now
    redirect_to new_session_path
  end

  private

  def password_params
    params.require(:user).permit(:email, :recovery_token)
  end
end
