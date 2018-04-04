class WelcomeController < ApplicationController
  skip_before_action :authentication_required

  def home
    if logged_in?
      redirect_to user_path(@current_user)
    end
  end

end
