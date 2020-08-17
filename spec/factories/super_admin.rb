FactoryBot.define do
  factory :super_admin do
    name { 'Admin' }
    email { 'admin@tutionapp.com' }
    password { '123456' }
  end
end
