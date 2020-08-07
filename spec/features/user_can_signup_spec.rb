require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  scenario 'Can signup to Acebook' do
    visit '/people/sign_up'
    fill_in 'email', with: 'bob@yahoo.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign up'
    expect(page).to have_content("You've successfully signed up with bob@yahoo.com")
  end
end
