require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments and view them" do
    create_comment
    expect(page).to have_content("Hello, Mars!")
    expect(page).to have_content("mins ago")
  end
end
