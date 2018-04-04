# This file executes a generator to create a fake Semester object with fake data
FactoryGirl.define do

  factory :semester do
    sequence(:semester_number)
    status true
    association(:study_program)
  end

end
