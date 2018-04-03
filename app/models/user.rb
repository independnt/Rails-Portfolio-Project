class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :backed_projects
  has_many :projects_backed, through: :backed_projects, source: 'project'
  validates :username, presence: true
  validates :email, presence: true
end
