class Comment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :text, presence: true

  def owner?(user)
    user === self.user
  end
end
