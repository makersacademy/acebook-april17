require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  let(:user){create(:user)}
  let(:user1){create(:user)}
  let(:post){create(:post)}

  scenario "Can view delete button" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_button("Delete")
  end

  # travis doesn't like the "accept_alert"
  # scenario "Can delete post" do
  #   sign_up
  #   click_link "New post"
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   # Capybara.using_wait_time(2000) 
  #   # page.accept_confirm do
  #   #   click_button 'Delete'
  #   # end
  #   first('.post').click_button 'Delete'
  #   # accept_alert {"Are you sure?"}
  #   page.driver.browser.switch_to.alert.accept

  #   expect(page).not_to have_content("Hello, world!")
  #   expect(page).not_to have_content(Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s)
  # end

  scenario "Can’t delete other users post" do
    post
    sign_up
    click_button("Delete")
    expect(page).to have_content("Thats not your post to delete")
  end


end
