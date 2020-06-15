require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "Sign Up page", type: :feature do
  scenario "redirected to sign up page" do
    visit "/"
    click_link "Sign up"
    expect(page.current_url).to eq("http://www.example.com/users/sign_up")
  end
end

RSpec.feature "Sign Up page", type: :feature do
  scenario "has correct url" do
    visit "/"
    click_link "Sign up"
    expect(page.current_url).to eq("http://www.example.com/users/sign_up")
  end
  scenario "contains texts fields for sign up" do
    visit "/"
    click_link "Sign up"
    expect(page).to have_content("Firstname")
    expect(page).to have_content("Lastname")
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("(6 characters minimum)")
    expect(page).to have_content("Password confirmation")
  end

  scenario "Sign up a user" do
    sign_up_as_ben()
    expect(page).to have_content("Welcome to BenSmith12's profile page")
  end
end

RSpec.feature "Logged in features", type: :feature do
  scenario "displays navigation bar buttons onced signed in" do
    sign_up_as_ben()
    expect(page).to have_link("Home")
    expect(page).to have_link("My Page")
    expect(page).to have_link("Logout")
  end
  scenario "personal home page has your own username" do
    sign_up_as_ben()
    click_link "My Page"
    expect(page).to have_content("Welcome to BenSmith12's profile page")
  end
  scenario "home page has the usernames of the other users" do
    generate_fake_users()
    expect(page).to have_content("BenSmith12")
    expect(page).to have_content("PaulKane12")
  end
  scenario "home page loads" do
    sign_up_as_ben()
    click_link "Home"
    expect(page.current_url).to eq("http://www.example.com/profiles")
  end
end

RSpec.feature "Logout", type: :feature do
  scenario "logout from homepage" do
    sign_up_as_ben()
    click_link "Home"
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
  end
  scenario "logout just after first creating account" do
    sign_up_as_ben()
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
  end
end

RSpec.feature "My Page", type: :feature do
  scenario "My page has correct text subject to that user" do
    sign_up_as_ben()
    click_link "My Page"
    expect(page).to have_content("Welcome to BenSmith12's profile page")
  end
  scenario "my profile has area for bio" do
    sign_up_as_ben()
    click_link "My Page"
    expect(page).to have_content("Bio")
  end
  scenario "My page has submit button" do
    sign_up_as_ben()
    click_link "My Page"
    expect(page).to have_button("Update")
  end
  scenario "create a post" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
  end
  scenario "expect created post to now be on My Page" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    expect(page).to have_content("Hello this is my first post")
  end
  scenario "url test" do
    sign_up_as_ben()
    click_link "My Page"
    expect(page.current_url).to have_content("http://www.example.com/profiles/")
  end
end
