class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) # ここでStrong Parametersを使用
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
      flash.now[:alert] = 'User was not created.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
