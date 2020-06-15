# frozen_string_literal: true

# comment model
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
