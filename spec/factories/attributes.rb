FactoryBot.define do

  factory :attribute do
    name   Faker::Job.field
    status true
    sequence(:code) { |n| "CODE#{n}" }
    sequence(:description) { |n| "description_#{n}" }
  end

end
