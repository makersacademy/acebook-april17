# frozen_string_literal: true

def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in 'Email', with: 'ben@gmail.com'
  fill_in 'Password', with: 'Password'
  click_button 'create'
end

def log_in
  fill_in 'Email', with: 'ben@gmail.com'
  fill_in 'Password', with: 'Password'
  click_button 'Log In'
end

def new_post
  sign_up
  click_link 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end
