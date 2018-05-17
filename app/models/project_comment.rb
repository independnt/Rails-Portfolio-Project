class ProjectComment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :comment, presence: true

  def user
    user = User.find_by(id: self.user_id)
    user.username
  end

end
