require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Users can delete their own comments" do
    visit('/')
    create_user
    login_user
    create_post
    visit('/posts')
    create_comment
    expect(page).to have_content('A comment')
    delete_comment
    expect(page).not_to have_content("A comment")
  end
end
