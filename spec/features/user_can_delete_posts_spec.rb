require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete specific posts" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password123')
    new_post('First post')
    new_post('Second post')
    
    within("div##{Post.first.id}") do
      click_link "Delete"
    end
    
    expect(page).not_to have_content("First post")
    expect(page).to have_content("Second post")
  end
end

