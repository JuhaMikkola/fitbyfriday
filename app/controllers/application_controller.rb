class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #before_filter :require_login

  protect_from_forgery with: :exception

  private
  def not_athenticated
    redirect_to login_path, alert: "Please login to schedule a workout"
  end


end
