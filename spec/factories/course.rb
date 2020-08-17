FactoryBot.define do
  factory :course do
    title { Faker::Name.unique.name }
    teacher
    content { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
    information { 'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' }
    start_datetime { Time.now + 1.month }
    end_datetime { Time.now + 2.month }

    trait :approved do
      approve { true }
    end

    trait :unapproved do
      approve { false }
    end

    trait :upcoming do
      start_datetime { Time.now + 1.month }
      end_datetime { Time.now + 2.month }
    end

    trait :ended do
      start_datetime { Time.now - 3.month }
      end_datetime { Time.now - 2.month }
    end

    trait :running do
      start_datetime { Time.now - 1.month }
      end_datetime { Time.now + 3.month }
    end
  end
end
