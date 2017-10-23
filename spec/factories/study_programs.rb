FactoryGirl.define do

  # Generate a fake record for StudyProgram model
  factory :study_program do
    name          Faker::App.name
    description   Faker::Lorem.characters(63)
    total_courses Faker::Number.between(30, 70)
    status        true
  end

end
