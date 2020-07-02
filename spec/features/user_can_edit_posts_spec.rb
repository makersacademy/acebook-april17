require 'rails_helper'
require_relative '../support/features/post_helpers.rb'

RSpec.feature "Edit", type: :feature do
  scenario "user can edit their own posts" do
    creates_a_post
    click_link "update"
    expect(page).to have_content(/bob1.*Hello, world!/)
  end

  scenario "edited post appears in post list" do
    creates_a_post
    click_link "update"
    fill_in "Message", with: "Hello, Brainaics!"
    click_on "Submit"
    expect(page).to have_content("bob1 Hello, Brainaics!")
  end

  scenario "user can not edit another user's posts" do
    creates_a_post
    click_on "Sign out"
    sign_in
    click_link "update"
    expect(page).to have_content("Cannot change another user's post")
  end

end
