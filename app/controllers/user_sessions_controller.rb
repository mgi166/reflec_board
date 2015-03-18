class UserSessionsController < ApplicationController
  include UserSessionsHelper

  # GET /user_sessions/new
  def new
  end

  # POST /user_sessions
  def create
    user = User.find_by(name: user_session_params[:name]).try(:authenticate, user_session_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'User session was successfully created.'
    else
      redirect_to login_url, notice: 'Login failed.'
    end
  end

  # DELETE /user_sessions/1
  def destroy
    logout
    redirect_to root_url, notice: 'User session was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_sessions).permit(:name, :password)
    end
end
