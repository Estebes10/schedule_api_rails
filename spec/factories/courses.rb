# This file executes a generator to create a fake Course object with fake data
FactoryBot.define do

  # Generate a fake record of Course model
  factory :course do
    sequence(:name) { |n| "#{Faker::Educator.course}#{n}" }
    sequence(:code) { |n| "#{Faker::University.greek_organization}#{n}" }
    description Faker::Lorem.sentence(4)
    courses     { { } }
    units       Faker::Number.between(3, 15)
    class_hours Faker::Number.between(1, 10)
    lab_hours   Faker::Number.between(1, 10)
    status      Faker::Boolean.boolean
  end

end
