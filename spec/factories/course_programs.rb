FactoryGirl.define do

  factory :course_program do
    association :study_program
    association :course
  end

end
