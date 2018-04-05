class ProjectsController < ApplicationController

  def new
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

  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :city, :user_id, :state, category_ids:[], categories_attributes:[:name])
  end

end
