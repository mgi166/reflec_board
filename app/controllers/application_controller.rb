class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def logout
    session.delete(:user_id)
    @currnet_user = nil
  end

  def login?
    !!current_user
  end
end
