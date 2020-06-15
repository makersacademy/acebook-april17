require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
    user_email = "bob@bob.com"
    user_password = "1234567890"
    scenario "user can sign up with email and password" do
        visit "/"
        click_link "Sign up"
        fill_in "Email", with: user_email
        fill_in "Password", with: user_password
        fill_in "Password confirmation", with: user_password
        length =  User.all.length
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
        expect(page).to have_content("Logged in as #{user_email}.")
        expect(User.all.length).to eq (length +1 )
    end
end
