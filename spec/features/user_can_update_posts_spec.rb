require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    
    within(first('div.posts')) do
      click_link 'Update post'
    end

    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
  end

  scenario 'cannot update a post if wait longer than wait time' do
    p Time.new
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    find('div.posts', wait: 10)

    visit '/'
    visit '/posts'
    
    within(first('div.posts')) do
      click_link('Update post')
      p 'do we get here?'
      p Time.new
    end

    expect(page).to have_content("This is the posts feed")
  end
end