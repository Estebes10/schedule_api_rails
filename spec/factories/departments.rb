FactoryGirl.define do

  factory :department do
    sequence(:name) { |n| "#{Faker::Team.name}#{n}" }
    sequence(:code) { |n| "#{Faker::University.greek_organization}#{n}" }
    description     Faker::Lorem.sentence(3)
    status          false
    association(:campu)
  end

end
