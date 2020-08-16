class CourseMailer < ApplicationMailer
  default from: 'info@tutionapp.com'
  # layout 'mailer'

  def course_approved_notification(course_join_request)
    @student = course_join_request.student
    @course = course_join_request.course

    mail(
      to: @student.email,
      subject: 'Course join request approve!',
      template_path: 'mailers/course_mailer',
      template_name: 'course_approved_notification'
    )
  end
end
