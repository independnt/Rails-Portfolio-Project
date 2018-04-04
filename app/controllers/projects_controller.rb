class ProjectsController < ApplicationController

  def new
    @project = Project.new(user_id: params[:user_id])
  end

end
