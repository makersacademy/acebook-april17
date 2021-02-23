RSpec.feature "Available posts", type: :feature do
  scenario "Can view all posts" do
    log_in
    visit "/courses/1"
    expect(page).to have_content("1 - Test Post")
  end

end
