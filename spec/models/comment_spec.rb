require 'rails_helper'

RSpec.describe Comment, type: :model do
  # User.new(name: 'Jeff', email: 'jeff@hotmail.com', password: 'password1')
  # Post.new(message: 'This is a post', user_id: 1)
  #

  subject do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    described_class.new(comment: "This is a test", user_id: 1, post_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a message' do
    subject.comment = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post_id' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if comment is over 250 chars' do
    subject.comment = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec."
    expect(subject).to_not be_valid
  end


end
