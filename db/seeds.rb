require 'nokogiri'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ADMIN TESTING SEED

# 50.times do
#   pw = "12345678"
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     salutation: Faker::Name.prefix,
#     email: Faker::Internet.email,
#     password: "12345678",
#     password_confirmation: "12345678",
#     phone_number: Faker::PhoneNumber.phone_number,
#     user_type: "citizen",
#     vat_number: Faker::Number.number(8),
#     active: true)
# end

# 100.times do
#   a = Account.new
#   a.save
# end

# 100.times do
#   Transaction.create(
#     transaction_type: "transfer",
#     sender: Account.all.sample,
#     receiver: Account.all.sample,
#     amount: rand(10..150),
#     reference: "DFCH-Z4353V",
#     status: "confirmed",
#     communication: "my favorite transaction")
# end

# MAIN FUNCTIONALITY SEED

# user1 = User.new(
#   first_name: "Frederic",
#   last_name: "Lambrechts",
#   salutation: "Mr.",
#   email: "fred@fred.com",
#   password: "12345678",
#   password_confirmation: "12345678",
#   phone_number: "0478 13 21 63",
#   user_type: "citizen",
#   vat_number: "BE435345745",
#   active: true)
# user1.save

# user2 = User.new(
#   first_name: "Ruben",
#   last_name: "Brands",
#   salutation: "Mr.",
#   email: "ruben@ruben.com",
#   password: "12345678",
#   password_confirmation: "12345678",
#   phone_number: "0033 958 235 45",
#   user_type: "citizen",
#   vat_number: "NL435345745",
#   active: true)
# user2.save

# user3 = User.new(
#   first_name: "Demo",
#   last_name: "1",
#   salutation: "Mr.",
#   email: "demo1@test.com",
#   password: "12345678",
#   password_confirmation: "12345678",
#   phone_number: "0032 478 235 453",
#   user_type: "citizen",
#   vat_number: "BE035345745",
#   active: true)
# user3.save

# 5.times do
#   Transaction.create(
#     transaction_type: "transfer",
#     sender: User.all.sample.account,
#     receiver: User.all.sample.account,
#     amount: rand(10..150),
#     reference: "expense",
#     status: "confirmed",
#     communication: "my favorite transaction")
# end

# 5.times do
#   Transaction.create(
#     transaction_type: "transfer",
#     sender: User.all.sample.account,
#     receiver: User.all.sample.account,
#     amount: rand(10..150),
#     reference: "income",
#     status: "confirmed",
#     communication: "my favorite transaction")

url = "http://valeureux.be/les-commerces/"

doc = Nokogiri::HTML(open(url))

links = doc.css(".valquoi a").map do |link |
 link.attr("href")
end

links.each do |url|
  shop = Nokogiri::HTML(open(url))
  user = {}
  shop.xpath("//meta").each do |elem|
    user[:shopname] = elem.attr("content") if elem.attr("property") == "og:title"
    user[:description] = elem.attr("content") if elem.attr("property") == "og:description"
    allmails = shop.xpath('//a[starts-with(@href, "mailto")]').map { |elem| elem.attr('href')}
    allmails.delete("mailto:info@valeureux.be")
    mail = allmails.first
    mail.to_s.slice! "mailto:"
    user[:email] = mail
  end
  User.create(
    shopname: user[:shopname],
    description: user[:description],
    address: "",
    website: "",
    phone_number: "",
    email: user[:email],
    password: "12345678",
    password_confirmation: "12345678",
    user_type: "shop",
    vat_number: "BE035345745",
    active: true
    )
end


