class ProjectCommentsController < ApplicationController

  def create
    @user = user.find_by[id: params[:user_id]]
    @project = @user.projects.find_by[id: params[:id]]
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_project_path(@user, @project)
    else
      render :user_project_path(@user, @project)
  end

  private

  def comment_params
    params.require(:project_comment).permit(:comment)
  end

end
