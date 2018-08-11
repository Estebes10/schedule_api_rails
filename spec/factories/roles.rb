# This file executes a generator to create a fake Role object with fake data
FactoryBot.define do

  # Generate a fake record of Role model
  factory :role do
    code        Faker::Lorem.characters(31)
    name        Faker::Job.field
    description 'Description for this code'
    status      true
  end

end
