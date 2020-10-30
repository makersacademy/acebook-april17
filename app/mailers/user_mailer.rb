class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers
  default template_path: 'users/mailer' 
  
  def welcome_reset_password_instructions(user)
    create_reset_password_token(user)
    mail(from: "Robot Lizard", to: user.email, subject: 'Welcome to the New Site')
  end

  private

  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
 end

 

end