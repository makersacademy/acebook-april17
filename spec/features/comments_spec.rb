require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "comment on post" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Comment on post"
    fill_in "comment[text]", with: "nice first post"
    click_button "submit"
    expect(page).to have_content("Hello this is my first post")
    expect(page).to have_content("nice first post")
  end
  scenario "comment count goes up" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Comment on post"
    fill_in "comment[text]", with: "nice first post"
    click_button "submit"
    expect(page).to have_content("Hello this is my first post")
    expect(page).to have_content("nice first post")
    click_link "My Page"
    expect(page).to have_content("View all comments (1)")
  end
end
