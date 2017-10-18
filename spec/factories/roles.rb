FactoryGirl.define do

  factory :role do
    name        Faker::Job.field
    description Faker::Job.title
    status      true
  end

end
