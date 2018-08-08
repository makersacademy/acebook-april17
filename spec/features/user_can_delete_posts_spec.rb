require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post

  end

  scenario "A user can delete post from the user homepage" do
    click_link("Delete")
    expect(page).to have_text('Your post has been deleted')
    expect(page).not_to have_text('test_first_name My first post less than a minute')
  end

  scenario "A user can delete post from the user post page" do
    click_link("View your profile")
    click_link("Delete")
    expect(page).to have_text('Your post has been deleted')
    expect(page).not_to have_text('test_first_name My first post less than a minute')
  end
end
