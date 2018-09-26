require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '#create' do
  it 'adds a user to the database' do
    @user = User.create({email: 'test@test.com', password: 'test'})
    expect(User.all.include?(@user)).to be(true)
  end

  it 'doesn\'t add empty details' do
    @user = User.create({email: '', password: ''})
    expect(User.all.include?(@user)).to be(false)
  end

  it 'doesn\'t add the same email twice' do
    @user1 = User.create({email: 'test@test.com', password: 'test'})
    @user2 = User.create({email: 'test@test.com', password: 'test'})
    expect(User.all.include?(@user1)).to be(true)
    expect(User.all.include?(@user2)).to be(false)
  end
end
