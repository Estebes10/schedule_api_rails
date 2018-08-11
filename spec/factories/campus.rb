# This file executes a generator to create a fake campus object with fake data
FactoryBot.define do

  factory :campu do
    sequence(:name) { |n| "#{Faker::University.name}#{n}" }
    sequence(:code) { |n| "#{Faker::University.greek_organization}#{n}" }
    description     Faker::Lorem.sentence(4)
    state           Faker::Address.state
    status          false
  end

end
