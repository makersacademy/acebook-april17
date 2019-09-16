require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '#lines' do
    it "returns an array of the lines in a post's message" do
      post = Post.new(message: "Hello\r\nWorld")
      expect(post.lines).to eq ["Hello", "World"]
    end
  end
  
  it { is_expected.to be }
end
