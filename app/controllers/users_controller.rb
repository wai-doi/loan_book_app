class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_users, only:[:index, :create]
  def index
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Loan was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    @users = User.all
    if @user.save
      redirect_to users_path
    else
      render :index
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
