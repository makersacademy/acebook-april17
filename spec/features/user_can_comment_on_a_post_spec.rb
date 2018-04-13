# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commenting on posts', type: :feature do
  scenario 'Can submit comments on posts' do
    sign_up
    add_new_post
    add_comment
    expect(page).to have_content('Charlene')
    expect(page).to have_content('Rails is awesome')
  end
end
