require 'rails_helper'

feature 'wall posts', type: :feature do
  before do
    sign_up
  end

  scenario 'user can post on own wall' do
    fill_in 'Message', with: 'Post on my wall'
    click_button 'Submit'
    expect(page).to_not have_current_path('/posts')
    expect(page).to have_content 'Post on my wall'
    expect(page).to have_content(Time.new.strftime('%I:%M %p, %A, %b %d'))
    expect(page).to have_content('Amy Smith')
  end
end
