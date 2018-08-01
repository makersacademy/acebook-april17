require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Can submit comments and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "This is a post"
    click_button "Submit"
    fill_in "comment[message]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_css('p', text: "This is a comment")
  end
end
