require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them with the time they were posted at." do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(Time.now.utc)
  end

  scenario "Posts appear in reverse chronological order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Last"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "Middle"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "First"
    click_button "Submit"

    expect("First").to appear_before("Middle")
    expect("Middle").to appear_before("Last")
  end
end
