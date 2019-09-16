require "rails_helper"

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view them" do
    # TODO: add login helper method
    sign_in
    visit "/posts"
    click_button "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_content("This is a comment")
  end
end
