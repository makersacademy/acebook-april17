# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'User can edit their own comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Updated Comment'
    click_button 'Save'
    expect(page).to have_content('Updated Comment')
  end

  scenario 'User cannot edit another users comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Logout'
    sign_up_two
    visit '/posts'
    click_link 'Edit Comment'
    expect(page).to have_content('Sorry you cannot edit this comment')
  end

  scenario 'User sees a message if updating the comment was successful' do
    sign_up
    new_post
    comment_on_post
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Updated Comment'
    click_button 'Save'
    expect(page).to have_content('Comment updated successfully')
  end

  scenario 'User cannot edit their own comment after 10 mins' do
    sign_up
    new_post
    comment_on_post
    Timecop.travel(Time.now + 11.minutes) do
      click_link 'Edit Comment'
      expect(page).to have_content('Sorry you cannot edit this comment')
      expect(page).to_not have_content('Updated Comment')
    end
  end

  scenario 'User can edit their own comment on a users wall' do
    sign_up
    new_post
    comment_on_post
    visit user_page_path(User.all.first.id)
    click_link 'Edit Comment'
    fill_in 'comment[body]', with: 'Updated Comment'
    click_button 'Save'
    expect(page).to have_content('Updated Comment')
  end

end
