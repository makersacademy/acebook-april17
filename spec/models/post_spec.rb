require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is not valid without valid user" do
    expect(Post.new).not_to be_valid
  end

  it "is not valid without content" do
    User.create(id: "1", username: "test_user", password: "very_secure_pw")
    new_post = Post.new
    new_post.user_id = "1"
    expect(new_post).not_to be_valid
  end

  it "is valid with valid attributes" do
    User.create(id: "1", username: "test_user", password: "very_secure_pw")
    new_post = Post.new
    new_post.user_id = "1"
    new_post.content = "Hello World!"
    expect(new_post).to be_valid
  end
end
