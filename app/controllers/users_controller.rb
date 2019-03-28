class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user_params[:password] == params[:user][:password_confirmation]
      @user.save
      redirect_to login_path
    else
      flash.notice = "Passwords do not match"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password)
  end
end
