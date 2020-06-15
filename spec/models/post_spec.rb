# frozen_string_literal: true

require 'rails_helper'

describe 'Post' do
  it 'has a message' do
    post = Post.new(message: 'Test message 1')
    expect(post.message).to eq 'Test message 1'
  end

  it 'has a wall id' do
    post = Post.new(message: 'Test message 1', wall_id: 1)
    expect(post.wall_id).to eq 1
  end
end
