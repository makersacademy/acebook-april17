require 'rails_helper'

feature 'list of users', type: :feature do
  before do
    sign_up
    log_out
    sign_up_as_second_user
  end

  scenario 'user can see a list of users' do
    click_link 'Users'
    expect(page).to have_content('Amy Smith')
    expect(page).to have_content('Bob Jones')
  end

  scenario 'user can click on a user and go to their page' do
    click_link 'Users'
    click_link 'Bob Jones'
    expect(page).to have_content("Bob Jones - Wall")
  end
end
