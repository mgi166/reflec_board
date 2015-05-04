class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  def create
    @user_session = UserSession.new(user_sessions_params)

    if @user_session.save
      redirect_back_or(musics_path, notice: "Login successful")
    else
      redirect_to login_url, alert: 'Login failed.'
    end
  end

  # DELETE /logout
  def destroy
    current_user_session.destroy
    redirect_to root_url, notice: 'Logout successful.'
  end

  private

  def user_sessions_params
    params.require(:user_sessions).permit(:username, :password)
  end
end
