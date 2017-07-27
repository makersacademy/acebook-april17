
def create_post(message: "Hello, world!")
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end

def sign_up(name: 'Tom', email: 'Tom@fakegmail.com', password: 'password123', password_confirmation: 'password123')
  visit('users/new')
  fill_in(:user_name, with: name)
  fill_in(:user_email, with: email)
  fill_in(:user_password, with: password)
  fill_in(:user_password_confirmation, with: password_confirmation)
  click_button('Submit')
end
