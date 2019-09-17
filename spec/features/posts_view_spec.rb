require 'rails_helper'
require "support/features/clearance_helpers"

RSpec.feature "Post", type: :feature do

  before(:each) do
    sign_in
  end

  scenario "Posts have a timestamps" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("UTC")
  end

  scenario "Posts with mutliple lines are displayed in multiple lines" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nThis is a new line\nAnd another line."
    click_button "Submit"
    expect(page).to have_selector("p", text: "Hello, world!")
    expect(page).to have_selector("p", text: "This is a new line")
    expect(page).to have_selector("p", text: "And another line.")
    expect(page).not_to have_selector("p", text: "Hello, world!\nThis is a new line\nAnd another line.")
  end


  scenario "Post can only be edited up to 10min after they have been created" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nThis is a new line\nAnd another line."
    click_button "Submit"
    current_time_plus_11 = Time.now + 660
    allow(Time).to receive(:now).and_return(current_time_plus_11)
    first('.post').click_link('edit')
    fill_in "Message", with: "Edited, This has been edited"
  end
end
