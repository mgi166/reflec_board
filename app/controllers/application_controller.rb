class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  helper_method :current_user, :logged_in?

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def logged_in?
    !! current_user
  end

  def require_login
    unless current_user
      store_location
      redirect_to login_url, notice: "You must be logged out to access this page"
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or(default, options)
    url = session[:return_to] || default
    redirect_to(url, options)
    session.delete(:return_to)
  end
end
