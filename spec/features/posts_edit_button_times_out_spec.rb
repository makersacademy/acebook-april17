require 'rails_helper'

require 'active_support/testing/time_helpers'

RSpec.feature 'Timeline', type: :feature do
  include ActiveSupport::Testing::TimeHelpers
  scenario 'Submitted posts edit button should not show after 10 minutes' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    travel 11.minutes
    visit '/posts'
    expect(first('.post')).not_to have_content("Edit")
  end

  context 'User does not refresh page when creating initial post' do
    scenario 'User cannot reach edit page' do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'testpass'
      fill_in 'Password confirmation', with: 'testpass'
      click_button 'Sign up'
      create_a_new_post_and_see_it_on_the_feed("Hello, world!")
      travel 11.minutes
      click_link "Edit"
      expect(page).to have_current_path('/posts')
      expect(page).to have_content("Exceeded ten minute marker for editing posts, you eejit!")
    end
  end
end
