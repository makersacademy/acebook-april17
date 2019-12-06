# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/users/sign_up'
    fill_in 'user_email', with: 'bob@bob.com'
    fill_in 'user_password', with: '123123'
    fill_in 'user_password_confirmation', with: '123123'
    click_button 'Sign up'
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello\n, world!'
    click_button 'Post!'
    expect(page).to have_content('Hello\n, world!')
  end
end
