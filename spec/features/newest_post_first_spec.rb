# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  before do
    sign_up
    create_post
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'This is a newer post'
    click_button 'Submit'
  end

  scenario 'The newest post is listed first' do
    sign_up
    create_post
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'This is a newer post'
    click_button 'Submit'
    expect(page.body.index('This is a newer post')).to be < page.body.index('This is a new post')
  end
end
