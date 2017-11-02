FactoryGirl.define do

  factory :campu do
    sequence(:name) { |n| "#{Faker::University.name}#{n}" }
    sequence(:code) { |n| "#{Faker::University.greek_organization}#{n}" }
    description     Faker::Lorem.sentence(4)
    state           Faker::Address.state
    status          false
  end

end
