class BackedProjectsController < ApplicationController
  before_action :logged_in?

  def back_project
    @project = Project.find(params[:id])
    @user = User.find_by(id: current_user.id)
    @user.add_project(@project)
    redirect_to user_project_path(@project.user, @project), flash:{notice: "You have officially backed this project!"}
  end

end
