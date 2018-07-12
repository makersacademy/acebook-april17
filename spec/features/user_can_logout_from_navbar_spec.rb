# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User can log out of account from their profile page", type: :feature do
  scenario 'successfully' do
    sign_up_successfully

    click_link 'Sign Out'
    expect(page).to have_content("Log in")
  end
end
