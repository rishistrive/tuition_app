FactoryBot.define do
  factory :teacher do
    name { 'John' }
    email { Faker::Internet.unique.email }
    password { '123456' }
  end
end
