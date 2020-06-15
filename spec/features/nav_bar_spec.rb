require 'rails_helper'
require "helpers/authentication_helper"

RSpec.feature "Navigation Bar", type: :feature do
  scenario "Have all buttons" do
    sign_in_as_tester
    expect(page).to have_link("Home")
    expect(page).to have_link("My Page")
    expect(page).to have_link("Logout")
  end
end
