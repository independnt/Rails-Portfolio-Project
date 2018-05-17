class ProjectCommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_id, :comment
  belongs_to :user
  belongs_to :project
end
