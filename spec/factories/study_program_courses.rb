# This class implements a generator to create one record which involves one
# course and one study_program
FactoryGirl.define do

  factory :study_program_course do
    association(:study_program)
    association(:course)
    semester_number Faker::Number.between(0, 9)
  end

end
