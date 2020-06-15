# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  before do
    sign_up
    create_post
  end

  scenario 'User can delete a post' do
    visit '/posts'
    click_link 'Delete'
    expect(page).not_to have_content 'This is a new post'
  end

  scenario 'User cannot delete another users post' do
    log_out
    sign_up_as_second_user
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content "You cannot delete someone else's post"
    expect(page).to have_content 'This is a new post'
  end
end
