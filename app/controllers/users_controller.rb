class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    @user.save!
    redirect_to @user, notice: t('.success')
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:name, t('.not_unique'))
    render :new
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.update!(user_params)

    redirect_to @user, notice: t('.success')
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:name, t('.not_unique'))
    render :edit
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: t('.success')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
