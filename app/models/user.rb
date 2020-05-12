class User < ApplicationRecord
  validates :name, presence: true 
  VALID_EMAIL_REGEX = /\w\S*@[a-z]*\.[a-z]{2,30}([a-z]|\.[a-z]{2,30})/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, presence: true,  length: { in: 6..10}
  
end
