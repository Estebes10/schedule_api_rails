# This class implements a generator to create one record which involves one
# course and one semester
FactoryGirl.define do

  factory :semester_course do
    association(:semester)
    association(:course)
  end

end
