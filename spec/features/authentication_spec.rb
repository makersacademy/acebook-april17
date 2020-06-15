feature 'Authentication' do
  scenario 'a logged out user tries to visit the posts page' do
    visit '/posts'
    expect(page).to have_content "You must be logged in to access this section"
  end

  scenario 'a logged in user tried to visit the posts page' do
    sign_up
    click_link 'Timeline'
    expect(page).to have_content "New post"
  end

  scenario 'a logged out user tries to view users page' do
    sign_up
    log_out
    visit "/1"
    expect(page).to have_content "You must be logged in to access this section"
  end
end
