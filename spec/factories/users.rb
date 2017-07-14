FactoryGirl.define do
  factory :user do
    phone Faker::PhoneNumber.cell_phone
    email Faker::Internet.email
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    middlename 'F.'
    password Faker::Internet.password
  end
end
