# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  acts_as_votable

  def not_editable?
    (Time.now - created_at) > 600 
  end

  def can_destroy?
    destroy
  end
end
