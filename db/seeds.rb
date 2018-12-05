# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
COUNTRY = ["Colombia", "Peru", "Ecuador", "Brazil", "Honduras", "Burundi", "Kenya"]
TREE = ["Arabica", "Robusta"]
SIZE = [8, 10, 12, 14, 16, 18, 20]
PROFILE = ["good cup", "clean cup", "Fine Cup", "Specialty", "Stocklot", "Defectuous"]
QUALITY = ["Supremo UGQ", "NY 2/3 sc18 fc", "Agasimbo", "Cherry AB"]
certifications = ["Fairtrade", "RFA", "Organic", "UTZ", "4C", "AAA", "Cafe Practice"]
STAGE = ["Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Offer Sample", "Sale Sample"]
CLIENTS = ["Starbucks", "Nestle", "McDonald", "Auchan", "TimHortons"]

def creating_sample(coffeelot, stage)
  sample = Sample.new(
    stage: stage,
    exporter: User.where(role: "Exporter").first,
    trader: User.where(role: "Trader").first,
    coffee_lot: coffeelot,
    status: "sent",
    acidity: rand(1..10),
    sweetness: rand(1..10),
    clean: rand(1..10)
    )
  sample.save
end


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

certifications.each do |certification|
  certif = Certification.new(name: certification)
  certif.save!
end

puts "creating user Carlos"
carlos = User.new(
  email: "carlos@gmail.com",
  role: "Exporter",
  company_name: "Sogimex",
  first_name: "Carlos",
  last_name: "Ghosn",
  phone_number: "06 11 22 33 44 55",
  password: "123456"
  )
carlos.save

puts "creating user Amandine"
amandine = User.new(
  email: "amandine@gmail.com",
  role: "Trader",
  company_name: "LDC",
  first_name: "Amandine",
  last_name: "Dubois",
  phone_number: "06 66 77 88 99",
  password: "123456"
  )
amandine.save

puts "creating 5 clients"
CLIENTS.each do |client|

  firstuser = User.new(
    email: "#{client}@gmail.com",
    role: "Client",
    company_name: client.to_s,
    first_name: client[0..2].to_s,
    last_name: client[3..-1].to_s,
    phone_number: "06 44 44 44 44",
    password: "123456"
    )
  firstuser.save
end


puts "creating 35 coffee lots"
5.times do
  puts "creating one coffeelot"

  coffeelot = CoffeeLot.new(
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
    coffeecertif = CoffeeCertification.new(coffee_lot: coffeelot, certification: Certification.all.first(Certification.count).sample)
    coffeecertif.save
  end

  puts "creating samples for this coffeelot"
    sample = Sample.new(
      stage: STAGE.sample,
      exporter: carlos,
      trader: amandine,
      coffee_lot: coffeelot,
      status: "pending"
      )
    sample.save


  # puts "creating samples for this coffeelot"
  #   example1 = Sample.new(
  #     stage: STAGE.sample,
  #     exporter: carlos,
  #     trader: amandine,
  #     coffee_lot: coffeelot,
  #     status: "received"
  #     )
  #   example1.save

  # puts "creating samples for this coffeelot"
  #   example2 = Sample.new(
  #     stage: STAGE.sample,
  #     exporter: carlos,
  #     trader: amandine,
  #     coffee_lot: coffeelot,
  #     status: "tested"
  #     )
  #   example2.save



  puts "adding historic to sample"
  if sample.stage == "Loading Sample"
    creating_sample(coffeelot, "Loading Sample")
  elsif sample.stage == "Port Sample"
    creating_sample(coffeelot, "Loading Sample")
    creating_sample(coffeelot, "Purchase Sample")
  elsif sample.stage == "Warehouse Sample"
    creating_sample(coffeelot, "Port Sample")
    creating_sample(coffeelot, "Loading Sample")
    creating_sample(coffeelot, "Purchase Sample")
  elsif sample.stage == "Offer Sample"
    creating_sample(coffeelot, "Warehouse Sample")
    creating_sample(coffeelot, "Port Sample")
    creating_sample(coffeelot, "Loading Sample")
    creating_sample(coffeelot, "Purchase Sample")
  elsif sample.stage == "Sale Sample"
    creating_sample(coffeelot, "Offer Sample")
    creating_sample(coffeelot, "Warehouse Sample")
    creating_sample(coffeelot, "Port Sample")
    creating_sample(coffeelot, "Loading Sample")
    creating_sample(coffeelot, "Purchase Sample")
  end


  puts "creating potential client list for this coffeelot"
  rand(1..3).times do
    potclient = PotentialClient.new(coffee_lot: coffeelot, client: User.where(role: "Client").first(User.where(role: "Client").count).sample)
    potclient.save
  end

  purchase = Purchase.new(
    exporter: carlos,
    trader: amandine,
    price: rand(1000..3000),
    quantity: rand(10..30),
    owner: (coffeelot.samples.last.stage == "Purchase Sample" ? carlos : amandine)
    )
  purchase.save

  coffeelot.save
end

puts "...."
puts "FINIHSHED"

