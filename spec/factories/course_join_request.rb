FactoryBot.define do
  factory :course_join_request do
    student
    course
    request_time { Time.now }

    trait :approved do
      approve { true }
    end

    trait :unapproved do
      approve { false }
    end
  end
end
