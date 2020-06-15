# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

feature 'update comments' do

  before do
    sign_up
    create_post
    create_comment
  end

  scenario 'user can update existing comment after creating' do
    within('.comment') do
      click_link 'Edit'
      end
      fill_in 'Body', with: 'Updated comment'
      click_button 'Submit'
      expect(page).to have_content 'Updated comment'
  end

  scenario "Cannot update a comment that's not their own" do
    log_out
    sign_up_as_second_user
    visit '/posts'
    within('.comment') do
      click_link 'Edit'
      end
    expect(page).to have_content('You can only edit your own comments')
  end

  scenario "Cannot update a comment after 10 minutes" do
    visit '/posts'
    Timecop.travel(Time.now + 11.minutes)
    within('.comment') do
      click_link 'Edit'
      end
    expect(page).to have_content('You can no longer edit this comment')
  end


end
