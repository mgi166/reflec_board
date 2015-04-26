class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      redirect_back_or(@user_session, notice: "Login successful")
    else
      render :new, alert: 'Login failed.'
    end
  end

  # DELETE /logout
  def destroy
    current_user_session.destroy
    redirect_to root_url, notice: 'Logout successful.'
  end
end
