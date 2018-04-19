# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete a post', type: :feature do
  scenario 'a user posts then deletes the post' do
    sign_up
    add_new_post
    click_button 'Delete'
    expect(page).not_to have_content 'Hello, world!'
  end
end
