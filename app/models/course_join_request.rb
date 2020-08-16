class CourseJoinRequest < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validate :max_three_courses_in_month

  private

  def max_three_courses_in_month
    errors.add(:course, "can't join more than 3 courses per month") if student.current_month_join_request.count > 3
  end
end
