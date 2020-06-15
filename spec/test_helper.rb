ENV['RAILS_ENV'] ||= 'test'


def is_logged_in?
  !session[:user_id].nil?
end

def sign_up
  visit '/'
  fill_in 'Name', with: 'Amy Smith'
  fill_in 'Email', with: 'amy@mail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password Confirmation', with: 'password'
  click_button 'Create my account'
end

def sign_up_as_second_user
  visit '/'
  fill_in 'Name', with: 'Bob Jones'
  fill_in 'Email', with: 'bob@mail.com'
  fill_in 'Password', with: 'bob12345'
  fill_in 'Password Confirmation', with: 'bob12345'
  click_button 'Create my account'
end

def log_out
  click_link 'Log out'
end

def log_in
  click_link 'Log in'
  fill_in 'Email', with: 'amy@mail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

def create_post
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'This is a new post'
  click_button 'Submit'
end

def create_comment
  visit '/posts'
  click_link 'Comment'
  fill_in 'Body', with: 'new comment'
  click_button 'Submit'
end

def create_wall_post
  fill_in 'Message', with: 'Post on my wall'
  click_button 'Submit'
end
