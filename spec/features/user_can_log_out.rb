require 'rails_helper'
require 'test_helper.rb'

RSpec.feature 'Logout', type: :feature do
  scenario 'User logs in with correct info' do
    sign_up
    log_out
    expect(page).to have_content 'Sign up'
  end
end
