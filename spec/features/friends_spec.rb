require 'rails_helper'
require "helpers/authentication_helper"

RSpec.feature "Friends", type: :feature do
  scenario "Add Friend button is present" do
    generate_fake_users()
    click_link "PaulKane12"
    expect(page).to have_button("Add as friend")
  end

  scenario "Add Friend button is functional" do
    generate_fake_users()
    click_link "PaulKane12"
    click_button("Add as friend")
  end

  scenario "Unfriend button present once user has been added as a friend" do
    generate_fake_users()
    click_link "PaulKane12"
    click_button("Add as friend")
    expect(page).to have_button("Unfriend")
  end

  scenario "unfriend someone but be able to add them as friend again" do
    generate_fake_users()
    click_link "PaulKane12"
    click_button("Add as friend")
    click_button("Unfriend")
    click_button("Add as friend")
  end

  scenario "added friends shows up on friend list on your own page" do
    generate_fake_users()
    click_link "PaulKane12"
    click_button("Add as friend")
    click_link("My Page")
    expect(page).to have_content("Friends (1)")
    expect(page).to have_content("PaulKane12")
  end
end
