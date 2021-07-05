class UserSettingsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = 'Settings updated successfully.'
    else
      flash[:alert] = "Could not update the settings - #{@user.errors.full_messages.join('; ')}"
    end

    render_flash
  end

  private

  def user_params
    user_params = params.require(:user).permit(:hat, :email, :username)
    user_params.delete(:password) if user_params[:password].nil?
    user_params
  end
end
