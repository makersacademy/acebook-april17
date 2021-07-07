require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Failing", type: :feature do
  scenario "Can not go to this page " do
    visit "/index"
    click_link "New post"
    expect(page).to have_content("Hello, biADSfasdFtches!")
  end
end
