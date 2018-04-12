module UsersHelper

  def correct_user(user)
    user == current_user
  end

  def guest_user(user)
    user != current_user
  end

  def backed_user(user, project)
    user.projects_backed.include?(project) if user 
  end

end
