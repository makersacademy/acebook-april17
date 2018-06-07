require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Posts should be displayed in chronological order" do
    sign_up_and_sign_in
    fill_in "Message", with: "Yo"
    click_button "Submit"
    fill_in "Message", with: "Bye"
    click_button "Submit"
    expect("Bye").to appear_before("Yo")
  end

  scenario "Post display a timestamp" do
    new_time = Time.local(2016, 6, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    fill_in "Message", with: "Yo"
    click_button "Submit"
    expect(page).to have_content("#{new_time}")
  end

  scenario "Doesn't allow empty posts" do
    new_time = Time.local(2015, 5, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    click_button "Submit"
    expect(page).not_to have_content("#{new_time}")
  end

  scenario "It deletes a post" do
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Message", with: "Yo"
    click_button "Submit"
    first('.item').click_link('Delete')
    expect(page).to have_content("Hello, world!")
    expect(page).not_to have_content("Yo")
  end

  scenario "It edits a post" do
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world"
    click_button "Submit"
    first('.item').click_link('Edit')
    fill_in "Message", with: "!"
    click_button "Update"
    expect(page).to have_content("!")
  end

  scenario "Cancel edit goes back to posts" do
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    first('.item').click_link('Edit')
    click_link "Cancel"
    expect(page).to have_content("Hello, world!")
    expect(page).not_to have_content("Update")
  end

  scenario "Cancel edit goes back to posts" do
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    first('.item').click_link('Edit')
    fill_in "Message", with: ""
    click_button "Update"
    expect(page).to have_content("Message can't be blank")
  end

end
