class Teacher < User
  has_many :courses
  has_many :comments, dependent: :destroy, foreign_key: :user_id
end
