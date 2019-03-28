class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email])
    if user && User.authenticate(params[:session][:email],params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif user == nil
      flash.notice = "That email has not been registered"
      redirect_to login_path
    else
      flash.notice = "That email/password combination is not correct"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have logged out"
    @current_user = nil
    redirect_to plants_path
  end
end
