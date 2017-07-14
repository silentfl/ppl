password = '12345678'

# users
admin = User.create!(
  email: 'admin@example.com',
  password: password,
  phone: '123456789',
  firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name,
  middlename: 'J.',
  admin: true
)

10.times do |index|
  firstname = Faker::Name.first_name
  User.create!(
    email: "#{firstname}@example.com",
    phone: "1234567#{index.to_s.rjust(2, '0')}",
    password:  password,
    firstname: firstname,
    lastname: Faker::Name.last_name,
    middlename: Faker::Name.title,
    deposit: Deposit.create
  )
end

# gateways
5.times { Gateway.create!(name: Faker::Lorem.word) }

# transactions
30.times do
  Transaction.create!(
    gateway: Gateway.offset(rand(Gateway.count)).first,
    deposit: Deposit.offset(rand(Deposit.count)).first,
    direction: rand(0..1),
    amount: Money.new(rand(100) * 100)
  )
end
