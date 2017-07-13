FactoryGirl.define do
  factory :transaction do
    user
    gateway
    direction { Transaction.directions.values.sample }
    comment { Faker::Lorem.sentence }
  end
end
