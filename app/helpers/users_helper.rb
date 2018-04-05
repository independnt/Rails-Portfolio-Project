module UsersHelper

  def project_list(user)
    link = ""
    user.projects.each do |project|
      link = link_to(project.name, user_project_path(user, project))
    end
    link
  end

  def edit_project(user, project)
    link_to "Edit Project", edit_user_project_path(user, project)
  end

  def delete_project(user, project)
    link_to "Delete Project", user_delete_project_path(user, project), method: :delete, confirm: "Are you sure?"
  end

end
