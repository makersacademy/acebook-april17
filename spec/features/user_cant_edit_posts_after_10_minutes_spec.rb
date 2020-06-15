# frozen_string_literal: true

require 'rails_helper'

describe 'can edit a post' do
  it 'create new post then immediately edit it' do
    sign_up
    # create a new post
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    # edit the message text
    click_link 'Edit'
    # change time by 10 minutes
    travel(11.minutes) do
      fill_in 'post[message]', with: 'Goodbye cruel world!'
      click_button 'Update'
      # check text on index page
      expect(page).not_to have_content('Goodbye cruel world!')
    end
    Time.current
  end
end
