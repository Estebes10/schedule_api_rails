FactoryGirl.define do

  # Generate a fake record for StudyProgram model
  factory :study_program do
    association(:career)
    sequence(:name) { |n| "#{Faker::App.name}#{n}" }
    description     Faker::Lorem.characters(63)
    status          true
  end

end
