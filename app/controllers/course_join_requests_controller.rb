class CourseJoinRequestsController < ApplicationController
  load_and_authorize_resource

  before_action :set_course, only: [:send_request]
  before_action :set_course_join_request, only: [:approve]

  def send_request
    respond_to do |format|
      course_join_request = @course.course_join_requests.build(request_time: Time.now, approve: false, student: current_user)
      if course_join_request.save
        format.html { redirect_to courses_path, notice: 'Course Join request was successfully sent.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :send_request }
      end
    end
  end

  def approve
    respond_to do |format|
      if @course_join_request.update(approve: true)
        CourseMailer.course_approved_notification(@course_join_request).deliver
        format.html { redirect_to received_course_requests_teacher_path(params[:teacher]), notice: 'Request was successfully approved.' }
      else
        format.html { render :approve }
      end
    end
  end

  private

  def set_course_join_request
    @course_join_request = CourseJoinRequest.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
