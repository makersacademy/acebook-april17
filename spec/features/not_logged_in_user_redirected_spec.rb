RSpec.feature 'Not logged in user redirected to homepage', type: :feature do
  scenario 'User redirected from private page to homeage' do
    visit('/posts')
    expect(current_path).to eq('/')
  end
end
