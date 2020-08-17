# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(:super_admin)
student = FactoryBot.create(:student, email: 'student@tutionapp.com')
teacher = FactoryBot.create(:teacher, email: 'teacher@tutionapp.com')
courses = FactoryBot.create_list(:course, 3, :approved, teacher: teacher)
courses.each do |course|
  FactoryBot.create(:course_join_request, :unapproved, course: course)
end

FactoryBot.create_list(:course_join_request, 3, :approved, student: student)
FactoryBot.create_list(:course_join_request, 10, :unapproved)
FactoryBot.create_list(:course, 3, :approved, :upcoming, teacher: teacher)
FactoryBot.create_list(:course, 3, :approved, :ended, teacher: teacher)
FactoryBot.create_list(:course, 3, :approved, :running, teacher: teacher)
FactoryBot.create_list(:course, 3, :unapproved, teacher: teacher)

puts '##########################################'

puts 'You can login as super admin with cred.'
puts 'Email:   admin@tutionapp.com'
puts 'Password:   123456'

puts '##########################################'

puts 'You can login as teacher.'
puts 'Email:   teacher@tutionapp.com'
puts 'Password:   123456'

puts '##########################################'

puts 'You can login as student.'
puts 'Email:   student@tutionapp.com'
puts 'Password:   123456'