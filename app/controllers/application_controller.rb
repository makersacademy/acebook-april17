class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(user)
    user_page_path(current_user.id)
  end
end
