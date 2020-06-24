class Mentor < User
  has_many :students, class_name: 'Student', foreign_key: 'user_id'
end
