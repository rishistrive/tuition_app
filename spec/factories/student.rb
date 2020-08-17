FactoryBot.define do
  factory :student do
    name { 'John' }
    email { Faker::Internet.email }
    password { '123456' }
  end
end
