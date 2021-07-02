class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    User.find(session[:user_id])
  end

  def render_flash
    render turbo_stream: turbo_stream.update('flash', partial: 'shared/flash')
  end
end
