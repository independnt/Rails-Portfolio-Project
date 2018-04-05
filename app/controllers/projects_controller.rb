class ProjectsController < ApplicationController

  def new
    @project = Project.new(user_id: params[:user_id])
  end

  def create

  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :city, :state, :user_id, :category_ids:[], categories_attributes:[:name])
  end

end
