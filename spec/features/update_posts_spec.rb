require 'rails_helper'

feature "updates posts" do

  scenario "Can edit the 6th post and view it updated" do
    signup()
    visit "/posts"
    add_post("I like toast")
    click_button "Edit6"
    fill_in "Message", with: "The 6th post has been changed"
    click_button "Submit"
    expect(page).to have_content("The 6th post has been changed")
  end

  scenario "doesn't see edit button on not their own post" do
    signup()
    visit "/posts"
    expect{click_button "Edit5"}.to raise_error(Capybara::ElementNotFound)
  end

  scenario "can only edit if it's the right user" do
    signup()
    visit "/posts"
    add_post("Sunny day!")
    click_button "Edit6"
    expect{page}.not_to raise_error()
  end

  scenario "can see user_id next to post" do
  signup()
  visit "/posts"
  add_post("Write a feature test")
  expect(page).to have_content "Foo : Write a feature test"
  end

end


def signup()
  visit "/signup"
  fill_in 'signup[username]', with: "Foo"
  fill_in 'signup[password]', with: "Bar"
  fill_in 'signup[email]', with: "Foo@Bar.com"
  click_button "Submit"
end

def add_post(message)
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
