require 'rails_helper'

feature 'comments', type: :feature do

  before do
    sign_up
    create_post
    log_out
  end

  scenario 'user can comment' do
    sign_up_as_second_user
    Timecop.travel(Time.now + 10.minutes)
    visit '/posts'
    click_link 'Comment'
    fill_in 'Body', with: 'new comment'
    click_button 'Submit'
    expect(page).to have_content('new comment')
    expect(page).to have_content((Time.now).strftime('%I:%M %p, %A, %b %d'))
    expect(page).to have_content 'Bob Jones'
  end
end
