class SessionsController < ApplicationController
  #skip_before_action :authentication_required

  def new
    if logged_in?
      redirect_to user_path(@current_user)
    end
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if @user = User.find_by(:email => oauth_email)
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to login_path
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


end
