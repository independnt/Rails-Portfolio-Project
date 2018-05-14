class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :city, :state
  belongs_to :user
end
