# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  before do
    @user = User.new(name: 'example', email: 'example@example.com',
            password: 'password', password_confirmation: 'password')
  end
  it 'should work with factory bot' do
    user1 = create(:user)
    expect(user1.valid?).to eq(true)
  end
  it 'name should be present' do
    @user.name = ''
    expect(@user.valid?).to eq(false)
  end
  it 'name should not be too long' do
    @user.name = 'n' * 51
    expect(@user.valid?).to eq(false)
  end
  it 'email should be present' do
    @user.email = ''
    expect(@user.valid?).to eq(false)
  end
  it 'email should not be too long' do
    @user.email = 'n' * 244 + '@example.com'
    expect(@user.valid?).to eq(false)
  end
  it 'should not accept invalid email' do
    @user.email = 'some.@example.@.com'
    expect(@user.valid?).to eq(false)
  end
  it 'should have a unique email' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user.valid?).to eq(false)
  end
  it 'should save the email as lower-case' do
    mixed_case_email = 'WaVeY@example.com'
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end
  it 'password should be present' do
    @user.password = @user.password_confirmation = '' * 5
    expect(@user.valid?).to eq(false)
  end
  it 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user.valid?).to eq(false)
  end

end
