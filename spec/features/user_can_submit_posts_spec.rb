# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content(Time.new.strftime('%I:%M %p, %A, %b %d'))
    expect(page).to have_content('Amy Smith')
  end
end
