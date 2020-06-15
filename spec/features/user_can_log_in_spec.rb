require 'rails_helper'
require 'test_helper.rb'

RSpec.feature 'Login', type: :feature do
  scenario 'User logs in with correct info' do
    sign_up
    log_out
    log_in
    expect(page).to have_content 'Amy Smith'
  end

  scenario 'User tries to log in with wrong info' do
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: 'wrong@mail.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'
    expect(page).to have_content 'Invalid login'
  end

  scenario 'User logs in and is redirected to their wall' do
    visit '/'
    sign_up
    expect(page).to have_content('Amy Smith - Wall')
  end
end
