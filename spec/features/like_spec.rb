require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Like a post" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Like"
    expect(page).to have_selector(:link_or_button, "Unlike (1)")
  end

  scenario "Unlike a post" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_button "Like"
    click_button "Unlike (1)"
    expect(page).to have_selector(:link_or_button, "Like (0)")
  end
end
