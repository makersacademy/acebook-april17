require 'rails_helper'

feature 'comments', type: :feature do

  before do
    sign_up
    create_post
  end

  scenario 'user can delete their own comment' do
    click_link 'Comment'
    fill_in 'Body', with: 'new comment'
    click_button 'Submit'
    within(:css, 'div.comment') do
      click_link 'Delete'
    end
    expect(page).to_not have_content('new comment')
    expect(page).to have_content('Comment deleted')
  end

  scenario "user cannot delete someone else's post" do
    click_link 'Comment'
    fill_in 'Body', with: 'new comment'
    click_button 'Submit'
    log_out
    sign_up_as_second_user
    visit '/posts'
    within(:css, 'div.comment') do
      click_link 'Delete'
    end
    expect(page).to have_content('new comment')
    expect(page).to have_content("You cannot delete someone else's comment")
  end
end
