# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



50.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    salutation: Faker::Name.prefix,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    user_type: "citizen",
    vat_number: Faker::Number.number(8),
    active: true)
end


100.times do
  a = Account.new
  a.save
end

100.times do
  Transaction.create(
    transaction_type: "transfer",
    sender: Account.all.sample,
    receiver: Account.all.sample,
    amount: rand(10..150),
    reference: "DFCH-Z4353V",
    status: "confirmed",
    communication: "my favorite transaction")
end



