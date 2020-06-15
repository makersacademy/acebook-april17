require 'rails_helper'

feature 'wall posts', type: :feature do
  before do
    sign_up
    create_wall_post
  end

  feature 'delete wall post' do
    scenario 'user can delete wall post' do
      click_link 'Delete'
      expect(page).not_to have_content 'Post on my wall'
      expect(page).to have_content 'Amy Smith - Wall'
    end

    scenario 'user can only delete their own post' do
      log_out
      sign_up_as_second_user
      click_link 'Users'
      click_link 'Amy Smith'
      click_link 'Delete'
      expect(page).to have_content "You cannot delete someone else's post"
    end
  end
end
