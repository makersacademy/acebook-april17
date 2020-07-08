require_relative 'clearance_helpers.rb'

def creates_a_post
  sign_up_with('bob@email.com', 'bob1', 'password1')
  visit "/posts"
  click_link "new post"
  fill_in "Message", with: "Hello, world!"
  click_button "submit"
end

def creates_a_post2
  click_link "new post"
  fill_in "Message", with: "Hello, again"
  click_button "submit"
end
