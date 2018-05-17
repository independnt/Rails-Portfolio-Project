class ProjectCommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_id, :comment 
end
