class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_user

  def current_user
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def require_user
    unless current_user
      store_location
      redirect_to login_url, notice: "You must be logged out to access this page"
    end
  end

  def store_location
    session[:return_to] = request.url
  end
end
