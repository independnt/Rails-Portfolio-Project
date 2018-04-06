class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @project = Project.new(user_id: params[:user_id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to user_project_path(@project.user_id, @project)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    if @project.nil?
      redirect_to @user, flash:{alert: "Project not found"}
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    @project.update(project_params)
    redirect_to user_project_path(@user, @project), flash: {notice: "Your project has been updated!"}
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    @project.destroy
    redirect_to root_path, flash:{notice: "Your project has been deleted"}
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :city, :user_id, :state, category_ids:[], categories_attributes:[:name])
  end

end
