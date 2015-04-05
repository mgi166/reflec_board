class UserSessionsController < ApplicationController
  include UserSessionsHelper

  # GET /login
  def new
  end

  # POST /user_sessions
  def create
    user = User.where(
             'name = ? OR email = ?',
             user_session_params[:name_or_email],
             user_session_params[:name_or_email]
           ).first

    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'User session was successfully created.'
    else
      redirect_to login_url, notice: 'Login failed.'
    end
  end

  # DELETE /logout
  def destroy
    logout
    redirect_to root_url, notice: 'User session was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_sessions).permit(:name_or_email, :password)
    end
end
