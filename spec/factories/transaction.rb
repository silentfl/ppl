FactoryGirl.define do
  factory :transaction do
    deposit
    gateway
    direction { Transaction.directions.values.sample }
    amount { Money.new(rand(1000..10_000)) }
    comment { Faker::Lorem.sentence }
  end
end
