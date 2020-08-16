module CoursesHelper
  def course_join_link(course)
    if current_user.not_approve_course_join_request?(course)
      link_to 'Sent request', '#', class: 'btn disabled'
    elsif current_user.accepted_course_join_request?(course)
      link_to 'Joined', '#', class: 'btn disabled'
    else
      link_to 'Send Join request', send_request_course_join_requests_path(course), class: 'btn btn-success'
    end
  end

  def filters_select_box
    options = Course::FILTERS.map { |f| [f.humanize, f] }
    select_tag 'course_filter', options_for_select(options), class: 'form-control', onchange: '$(this.form).submit();'
  end
end
