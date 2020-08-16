class Student < User
  has_many :course_join_requests, -> { where approve: true }
  has_many :courses, through: :course_join_requests
  has_many :comments, dependent: :destroy, foreign_key: :user_id

  def accepted_course_join_request?(course)
    course_join_requests.where(course: course).any?
  end

  def not_approve_course_join_request?(course)
    CourseJoinRequest.where(course: course, student: self, approve: false).any?
  end

  def current_month_join_request
    course_join_requests.where('created_at > ? AND created_at < ?', Time.now.beginning_of_month, Time.now.end_of_month)
  end
end
