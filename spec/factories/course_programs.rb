FactoryGirl.define do

  # Generate a fake association between Course and StudyProgram, after create
  # a new record for both models
  factory :course_program do
    association :study_program
    association :course
  end

end
