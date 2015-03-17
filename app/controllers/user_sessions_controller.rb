class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:show, :edit, :update, :destroy]

  # GET /user_sessions/new
  def new
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    user = User.find_by(name: user_session_params[:name]).try(:authenticate, user_session_params[:password])
    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html { redirect_to root_url, notice: 'User session was successfully created.' }
        format.json { render :show, status: :created, location: @user_session }
      else
        format.html { render :new }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session.destroy
    respond_to do |format|
      format.html { redirect_to user_sessions_url, notice: 'User session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      @user_session = UserSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params[:user_sessions]
    end
end
