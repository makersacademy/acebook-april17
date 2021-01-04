require 'rails_helper'

feature 'Signing Out' do
  before do
    sign_in1
  end
  it 'Signs out successfully' do
    click_button 'Log out'
    puts page.body
    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(current_path).to eq('/')
    expect(page).to have_no_content("Welcome! You have signed up successfully.")
  end
end
