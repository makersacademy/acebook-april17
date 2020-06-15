require 'rails_helper'
require "helpers/authentication_helper"

RSpec.feature "Create posts", type: :feature do
  scenario "Can post" do
    sign_in_as_tester
    click_link "My Page"
    expect(page).to have_content("No posts :(")
  end

  scenario "Can post" do
    sign_in_as_tester
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    expect(page).to have_content("Hello this is my first post")
  end

  scenario "Can edit post" do
    sign_in_as_tester
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Edit"
    fill_in "post_text", with: "Second post"
    click_button "Update"
    expect(page).to have_content("Second post")
    expect(page).to have_no_content("Hello this is my first post")
  end
  scenario "Can delete post" do
    sign_in_as_tester
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Delete"
    expect(page).to have_no_content("Hello this is my first post")
  end
end
