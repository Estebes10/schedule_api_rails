FactoryGirl.define do

  # Generate a fake record of Course model
  factory :course do
    name        Faker::Educator.course
    code        Faker::University.greek_organization
    description Faker::Lorem.words(10)
    units       Faker::Number.between(3, 15)
    class_hours Faker::Number.between(1, 10)
    lab_hours   Faker::Number.between(1, 10)
    status      Faker::Boolean.boolean
  end

end
