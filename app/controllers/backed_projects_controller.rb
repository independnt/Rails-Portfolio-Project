class BackedProjectsController < ApplicationController
  before_action :authentication_required

  def back_project
    @project = Project.find(params[:id])
    @user = User.find_by(id: current_user.id)
    if @user.projects_backed.where(id: @project.id).exists?
      redirect_to user_project_path(@project.user, @project), flash:{notice: "You already backed this project!"}
    else
      @user.add_project(@project)
      redirect_to user_project_path(@project.user, @project), flash:{notice: "You have officially backed this project!"}
    end
  end

end
