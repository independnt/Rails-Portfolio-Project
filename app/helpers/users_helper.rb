module UsersHelper

  def project_list(user)
    link = ""
    user.projects.each do |project|
      link = link_to(project.name, user_project_path(user, project))
    end
    link
  end

end
