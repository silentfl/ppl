FactoryGirl.define do
  factory :deposit do
    user
    amount { Money.new(rand(1000..10_000)) }
  end
end
