require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can log out" do
    User.create!(username: "yo man",email: "123@123.123", password: "1234567")

    visit "/"

    fill_in "email", with: "123@123.123"
    fill_in "password", with: "1234567"
    click_button("Log in")

    click_link("Log out")
    expect(page).to have_content("Sign in")
  end
end
