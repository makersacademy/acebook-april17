# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'User can delete their own comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Delete Comment'
    expect(page).to_not have_content('First Comment')
  end

  scenario 'User cannot delete another users comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Logout'
    sign_up_two
    visit '/posts'
    click_link 'Delete Comment'
    expect(page).to have_content('Sorry you cannot delete this comment')
    expect(page).to have_content('First Comment')
  end

  scenario 'User sees a message if deleting the comment was successful' do
    sign_up
    new_post
    comment_on_post
    click_link 'Delete Comment'
    expect(page).to have_content('Comment deleted successfully')
  end

  scenario 'User can delete their own comment on a users wall' do
    sign_up
    new_post
    comment_on_post
    visit user_page_path(User.all.first.id)
    click_link 'Delete Comment'
    expect(page).to_not have_content('First Comment')
  end

end
