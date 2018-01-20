FactoryGirl.define do

  factory :semester do
    sequence(:semester_number)
    status true
    association(:study_program)
  end

end
