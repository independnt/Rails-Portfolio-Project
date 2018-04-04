class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path, flash:{alert: "Please enter a valid username AND password."}
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end


end
