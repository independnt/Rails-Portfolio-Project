class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]
  before_action :access_user, only:[:edit, :update]

  def new
    if logged_in?
      redirect_to user_path(current_user), flash:{notice: "already logged in!"}
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:password] == params[:password_confirmation] && @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user, flash:{notice: "Your account has been successfully updated!"}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to active_projects_path, flash:{alert: "That user does not exist."}
  end

  def access_user
    @user = User.find_by(id: params[:id])
    unless current_user == @user
      redirect_to active_projects_path, flash:{alert: "You don't have access to that."}
    end
  end

end
