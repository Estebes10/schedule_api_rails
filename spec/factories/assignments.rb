FactoryGirl.define do

  # Generate a fake association between User and Role, after create a new record
  # for both models
  factory :assignment do
    association :user
    association :role
  end

end
