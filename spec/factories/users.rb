FactoryGirl.define do

  factory :user do
    name             Faker::Name.name
    last_name        Faker::Name.last_name + ' ' + Faker::Name.last_name
    password         'contrasena'
    id_collegue      Faker::Company.norwegian_organisation_number
    email            Faker::Internet.email
    phone            Faker::PhoneNumber.cell_phone
    gender           'Female'
    birthday         Faker::Date.between(70.years.ago, Date.today)
    status           Faker::Boolean.boolean
  end

end
