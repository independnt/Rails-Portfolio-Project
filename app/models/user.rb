class User < ApplicationRecord
  has_many :projects
  has_many :backed_projects
  has_many :projects_backed, through: :backed_projects, source: 'project'
end
