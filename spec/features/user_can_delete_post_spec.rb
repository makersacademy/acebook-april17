require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a post" do
    create_post
    click_link 'Delete Post'
    expect(page).not_to have_content("Hello, world!")
  end
end
