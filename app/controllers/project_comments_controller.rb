class ProjectCommentsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    @comment = ProjectComment.new(comment_params)
    if @comment.save
      redirect_to user_project_path(@user, @project)
    else
      render controller: 'project', action: 'show', user_id: @user, id: @project
    end
  end

  private

  def comment_params
    params.require(:project_comment).permit(:user_id, :project_id, :comment)
  end

end
