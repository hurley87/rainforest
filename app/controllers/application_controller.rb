class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private 

  def current_user
  	@current_user ||= User.find(session[:id]) if session[:id]
  end

  helper_method :current_user

  def ensure_logged_in
    unless current_user
    	flash[:alert] = "Please Log In"
    	redirect_to new_session_path
    end
  end
end
