require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { described_class.new }

  describe 'associations' do
    it { is_expected.to have_many(:course_join_requests).conditions(approve: true) }
    it { is_expected.to have_many(:courses).through(:course_join_requests) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'instance methods' do
    it '#accepted_course_join_request?' do
      course_join_request = create(:course_join_request, :approved)
      student = course_join_request.student
      course = course_join_request.course
      expect(student.accepted_course_join_request?(course)).to be_truthy
    end

    it '#not_approve_course_join_request?' do
      course_join_request = create(:course_join_request, :unapproved)
      student = course_join_request.student
      course = course_join_request.course
      expect(student.not_approve_course_join_request?(course)).to be_truthy
    end

    it '#current_month_join_request?' do
      student = create(:student)
      course_join_request = create_list(:course_join_request, 3, :approved, student: student)
      expect(student.current_month_join_request.count).to eq(3)
    end
  end
end
