class ProjectsController < ApplicationController
  before_action :set_user_and_project, only:[:show, :edit, :update, :destroy]
  before_action :allowed_user, only:[:edit, :destroy]

  def index
    @projects = Project.active_projects
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.new(user_id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @project = Project.new(project_params)
    if @project.save
      redirect_to user_project_path(@project.user_id, @project)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to user_project_path(@user, @project), flash: {notice: "Your project has been updated!"}
  end

  def destroy
    @project.destroy
    redirect_to root_path, flash:{notice: "Your project has been deleted"}
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :city, :user_id, :active, :state, category_ids:[], categories_attributes:[:name])
  end

  def set_user_and_project
    if params[:user_id] && User.exists?(params[:user_id])
      @user = User.find_by(id: params[:user_id])
      @project = @user.projects.find_by(id: params[:id])
      if @project.nil?
        redirect_to active_projects_path, flash:{alert: "That project does not exist."}
      end
    else
      redirect_to active_projects_path, flash:{alert: "That user does not exist."}
    end
  end

  def allowed_user
    @project = Project.find_by(id: params[:id])
    unless current_user == @project.user
      redirect_to active_projects_path, flash:{alert: "You don't have access to that."}
    end
  end



end
