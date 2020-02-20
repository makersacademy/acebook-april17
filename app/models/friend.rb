class Friend < ApplicationRecord
  validates_uniqueness_of :friend_id, scope: :recipient_friend_id
end
