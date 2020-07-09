require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  end

  scenario "Have the option to add a comment" do
    expect(page).to have_button("Comment")
  end

  scenario "Can add a comment" do
    fill_in "comment_body", with: "This is a test"
    click_button "Comment"
    expect(page).to have_content("This is a test")
  end

  scenario "comments cannot be blank" do
    fill_in "comment_body", with: "   "
    click_button "Comment"
    expect(page).to have_content("comments cannot be blank")
  end

  # Needs sign out button implementation
  # scenario "Can see another users name above that users post" do
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   click_button "Sign Out"
  #   click_link "Sign Up"
  #   fill_in "First Name", with: "test2firstname"
  #   fill_in "Last Name", with: "testlastname"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   fill_in "Confirm Password", with: "123456"
  #   click_button "Create User"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   click_button "Login"
  #   expect(page).to have_content("testfirstname")
  # end
end