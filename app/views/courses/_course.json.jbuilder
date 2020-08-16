json.extract! course, :id, :information, :title, :content, :start_datetime, :end_datetime, :students_length, :created_at, :updated_at
json.url course_url(course, format: :json)
