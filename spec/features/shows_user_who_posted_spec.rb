require 'rails_helper'

RSpec.feature "Shows user", type: :feature do
  scenario "Can delete posts" do
    sign_up
    add_post
    expect(find("div#post_username_0")).to have_content("test")
    expect(find("div#post_message_0")).to have_content("Hello, world!")
  end
end
