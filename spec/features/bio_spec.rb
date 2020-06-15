require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "bio", type: :feature do
  scenario "Write bio" do
    sign_in_as_tester
    click_link "My Page"
    fill_in "bio_age", with: "50"
    fill_in "bio_bio", with: "I like long walks and wine"
    fill_in "bio_location", with: "Swansea"
    click_button "Update"
    expect(page).to have_content("50")
    expect(page).to have_content("I like long walks and wine")
    expect(page).to have_content("Swansea")
  end

  scenario "Edit bio" do
    sign_in_as_tester
    click_link "My Page"
    fill_in "bio_age", with: "50"
    fill_in "bio_bio", with: "I like long walks and wine"
    fill_in "bio_location", with: "Swansea"
    click_button "Update"
    click_button "Edit About me"
    fill_in "bio_age", with: "20"
    fill_in "bio_bio", with: "I love coding"
    fill_in "bio_location", with: "London"
    click_button "Update"
    expect(page).to have_content("20")
    expect(page).to have_content("I love coding")
    expect(page).to have_content("London")
  end
end
