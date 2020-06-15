# frozen_string_literal: true

# user helper
module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def check_login_success(_user)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Acebook'
      redirect_to @user
    else
      render 'new'
    end
  end
end
