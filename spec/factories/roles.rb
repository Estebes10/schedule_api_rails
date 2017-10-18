FactoryGirl.define do

  factory :role do
    code        Faker::Lorem.characters(31)
    name        Faker::Job.field
    description 'Description for this code'
    status      true
  end

end
