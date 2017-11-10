FactoryGirl.define do

  factory :semester do
    semester_number Faker::Number.between(1, 10)
    status          true
    association(:study_program)
  end

end
