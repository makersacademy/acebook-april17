# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

RSpec.feature 'Timeline', type: :feature do

  before do
    sign_up
    create_post
  end

  scenario 'Can update post after creating it' do
    click_link 'Edit'
    expect(page).to_not have_content('You can only edit your own posts')
    expect(page).to_not have_content('You can no longer edit this post')
    fill_in 'Message', with: 'This is an updated post'
    click_button 'Submit'
    expect(page).to have_content('This is an updated post')
    expect(page).to have_content(Time.now.strftime('%I:%M %p'))
  end

  scenario "Cannot update a post that's not their own" do
    log_out
    sign_up_as_second_user
    visit '/posts'
    click_link 'Edit'
    expect(page).to have_content('You can only edit your own posts')
    expect(page).to_not have_content('You can no longer edit this post')
  end

  scenario 'User can only update a post within 10 minutes' do
    visit '/posts'
    Timecop.travel(Time.now + 11.minutes) do
      click_link 'Edit'
      expect(page).to have_content('You can no longer edit this post')
      expect(page).to_not have_content('You can only edit your own posts')
    end
  end
end
