require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    signup
    login
    visit "/posts"
    click_on "New post"
    fill_in "Message", with: "Hello,\nworld!"
    click_button "Submit"
    expect(page.html).to include("Hello,\r<br>world!")
    click_button "Delete"
    expect(page.html).to_not include("Hello,\r<br>world!")
  end
end
