# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
COUNTRY = ["Colombia", "Perou", "Ecuador", "Brazil", "Honduras"]
TREE = ["Arabica", "Robusta"]
SIZE = [8, 10, 12, 14, 16, 18, 20]
PROFILE = ["good cup", "clean cup", "supremo UGQ", "Agasimbo", "Cherry", "AB"]
QUALITY = ["a", "b", "c", "d"]
certifications = ["Fairtrade", "RFA", "Organic", "UTZ", "4C", "AAA", "Cafe Practice"]
certifications.each do |certification|
  certification.create(name: certification)
end
STAGE = ["Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Offer Sample", "Sale Sample"]
CLIENTS = ["Starbucks", "Nestle", "McDonald", "Auchan", "Tim Hortons"]


puts "destroying samples"
Sample.destroy_all
puts "destroying coffee certification"
CoffeeCertification.destroy_all
puts "destroying potential_clients"
PotentialClient.destroy_all
puts "certification"
Certification.destroy_all
puts "destroying coffee_lots"
CoffeeLot.destroy_all
puts "destroying purchases"
Purchase.destroy_all
puts "destroying users"
User.destroy_all

puts "DESTRUCTIONS TERMINATED"




puts "creating user Carlos"
carlos = User.create(
  email: "carlos@gmail.com",
  role: "Exporter",
  company_name: "Sogimex",
  first_name: "Carlos",
  last_name: "Ghosn",
  phone_number: "06 11 22 33 44 55",
  password: "123456"
  )


puts "creating user Amandine"
amandine = User.create(
  email: "amandine@gmail.com",
  role: "Trader",
  company_name: "LDC",
  first_name: "Amandine",
  last_name: "Dubois",
  phone_number: "06 66 77 88 99",
  password: "123456"
  )

puts "creating 5 clients"
CLIENTS.each do |client|

  User.create(
    email: "#{client}@gmail.com",
    role: "Client",
    company_name: client,
    first_name: client[0, 2],
    last_name: client[3, -1],
    phone_number: "06 44 44 44 44",
    password: "123456"
    )
end


puts "creating 5 coffee lots"
5.times do
  puts "creating one coffeelot"

  coffeelot = Coffee.create(
    provenance: COUNTRY.sample,
    quantity: rand(1..20),
    tree: TREE.sample,
    iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
    screen_size: SIZE.sample,
    cup_profile: PROFILE.sample,
    region: "South America",
    quality_description: QUALITY.sample
    )
  puts "creating certifications for this coffeelot"
  rand(1..5).times do
    coffee_certifications.create(coffee_lot: coffeelot, certification: Certification.all.first(Certification.count).sample)
  end

  puts "creating samples for this coffeelot"
  rand(6..10).times do
    sample = Sample.create(
      stage: STAGE.sample,
      exporter: carlos,
      trader: amandine,
      coffee_lot: coffeelot,
      status: "Pending"
      )
  end

  puts "creating potential client list for this coffeelot"
  rand(1..3).times do
    PotentialClient.create(coffee_lot: coffeelot, client: Certification.all.first(Certification.count).sample)
  end

  Purchase.create(
    exporter: carlos,
    trader: amandine,
    price: rand(1000..3000),
    quantity: rand(10..30)
    )
end

