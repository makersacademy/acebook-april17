require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can Sign Up" do
    visit signup_path
    fill_in "First Name", with: "Superman"
    fill_in "Last Name", with:" Kent"
    fill_in "Email", with: "superman@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button "Sign Up"
    expect(page).to have_content("You have signed up")
  end
end
