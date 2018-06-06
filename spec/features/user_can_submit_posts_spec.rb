require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Posts should be displayed in chronological order" do
    visit "/posts"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    fill_in "Message", with: "Bye"
    click_button "Submit"
    expect("Bye").to appear_before("Yo")
  end

  scenario "Post display a timestamp" do
    new_time = Time.local(2016, 6, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    visit "/posts"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    expect(page).to have_content("#{new_time}")
  end
end
