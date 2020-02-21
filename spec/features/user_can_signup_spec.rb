RSpec.feature 'Users can signup to site', type: :feature do
  scenario 'Can visit Signup Page' do
    visit('/')
    click_on('Signup')
    expect(page).to have_content('Please Signup')
  end

  scenario 'User can signup' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('Congratulations user1, You Have Signed Up to wookiebook!')
    expect(page).to have_content('Planet: Kashyyyk')
    expect(page).to have_content('user1')
  end

  scenario 'User cannot sign up with email which is already taken' do
    User.create!(email: 'test@test.com', password: 'password').save
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('Email already taken, please choose another')
  end

  scenario 'User cannot sign up with invalid email' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@testcom')
    fill_in('user[password]', with: 'password')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('Email format invalid, please enter valid email')
  end

  scenario 'User cannot sign up with email whos domain does not exist' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@domain.nahhh')
    fill_in('user[password]', with: 'password')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('Email format invalid, please enter valid email')
  end

  scenario 'User cannot sign up password less than 6 charaters' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'passw')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('The password must have at least 6 characters')
  end

  scenario 'User cannot sign up password more than 10 charaters' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password10c')
    page.select('Kashyyyk', from: 'user[planet]')
    click_on('Join the Rebel Alliance')
    expect(page).to have_content('The password must have no more than 10 characters')
  end
end
