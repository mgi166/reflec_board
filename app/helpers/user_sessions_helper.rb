module UserSessionsHelper
  def current_user
    @current_user ||= User.find(sessins[:user_id]) if sessins[:user_id]
  end

  def login?
    !!current_user
  end
end
