def sign_in_helper(user)
  visit('/signin')
  fill_in 'session[email]', with: user.email.downcase
  fill_in 'session[password]', with: user.password
  click_button 'Sign in'
end
