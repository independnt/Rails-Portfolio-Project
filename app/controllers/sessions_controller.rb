class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(@current_user), flash:{notice: "already logged in!"}
    end
    @user = User.new
  end

  def create
    if auth
      if @user = User.find_by(:email => auth["info"]["email"])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to login_path, flash:{alert: "User doesn't exist, please sign up first!"}
      end
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to login_path, flash:{alert: "Please enter a valid username AND password."}
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
