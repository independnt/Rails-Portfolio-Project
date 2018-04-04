class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :backed_projects
  has_many :projects_backed, through: :backed_projects, source: 'project'
  validates :username, presence: true
  validates :email, presence: true

  def add_project(project)
    if self.projects_backed.where(id: project.id).empty?
      BackedProject.create(article: project)
    end
  end


end
