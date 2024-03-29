# This file executes a generator to create a fake Career object with fake data
FactoryBot.define do

  factory :career do
    sequence(:name) { |n| "#{Faker::Company.profession}#{n}" }
    sequence(:code) { |n| "#{Faker::Code.asin}#{n}" }
    description     Faker::Company.catch_phrase
    status          Faker::Boolean.boolean
    association(:department)
  end

end
