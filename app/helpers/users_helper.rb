module UsersHelper

  def project_list(user)
    user.projects.each do |project|
      link_to "project.name", user_project_path(user, project)
    end
  end

end
