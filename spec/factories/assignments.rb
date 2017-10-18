FactoryGirl.define do

  factory :assignment do
    association :user
    association :role
  end

end
