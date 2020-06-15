# frozen_string_literal: true

# posts!
class Post < ApplicationRecord
  has_many :comments
  belongs_to :user, foreign_key: 'user_id'
end
