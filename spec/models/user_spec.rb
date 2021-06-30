require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: "Anything",
    email: "example@gmail.com",
    password: "password123"
  )
}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a username" do 
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it "username should not be too long" do
    subject.username = "a"*51
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do 
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "email should not be too long" do
    subject.email = "a"*244 +"@example.com"
    expect(subject).to_not be_valid
  end


  it "email should be correct format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      subject.email = invalid_address
      expect(subject).to_not be_valid
    end
  end 

  it "is not valid without a password" do 
    subject.password = nil
    expect(subject).to_not be_valid
  end


end