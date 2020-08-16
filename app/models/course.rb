class Course < ApplicationRecord
  FILTERS = %w[all ended running upcoming].freeze

  scope :approved, -> { where(approve: true) }
  scope :unapproved, -> { where(approve: false) }
  scope :upcoming, -> { where('start_datetime > ?', Time.now) }
  scope :ended, -> { where('end_datetime < ?', Time.now) }
  scope :running, -> { where('start_datetime < (?) AND end_datetime > (?)', Time.now, Time.now) }

  belongs_to :teacher
  has_many :course_join_requests, -> { where(approve: true) }
  has_many :students, through: :course_join_requests
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
