COUNTRY = ["Colombia", "Peru", "Costa Rica", "Brazil", "Honduras", "Burundi", "Kenya"]
TREE = ["Arabica", "Robusta"]
SIZE = [8, 10, 12, 14, 16, 18, 20]
PROFILE = ["good cup", "clean cup", "Fine Cup", "Specialty", "Stocklot", "Defectuous"]
QUALITY = ["Supremo UGQ", "AB FAQ fly crop", "Fully Washed A", "NY 2/3 sc18 fc", "Agasimbo", "Cherry AB"]
certifications = ["Fairtrade", "RFA", "Organic", "UTZ", "4C", "AAA", "Cafe Practice"]
STAGE = ["Offer Sample", "Purchase Sample", "Loading Sample", "Port Sample", "Warehouse Sample", "Sale Sample"]
CLIENTS = ["Starbucks", "Nestlé", "McDonald", "Auchan", "TimHortons"]
PHONE = ["1 rue de la Centrale, Villeneuve d'Ascq, France", "1 place de Seattle, Lausanne, Suisse", "131 rue du café, 75011 Paris", "1145 5th Avenue, New York, USA"]

def creating_sample(coffeelot, stage)
  sample1 = Sample.new(
    stage: stage,
    exporter: User.where(role: "Exporter").first,
    trader: User.where(role: "Trader").first,
    coffee_lot: coffeelot,
    status: "sent",
    acidity: rand(1..10),
    sweetness: rand(1..10),
    clean: rand(1..10)
    )
  sample1.save
end

puts "destroying etiquettes"
Etiquette.destroy_all
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

puts "..."
puts "DESTRUCTIONS TERMINATED"
puts "..."

certifications.each do |certification|
  certif = Certification.new(name: certification)
  certif.save!
end

puts "Creating exporter Carlos"
carlos = User.new(
  email: "carlos.sogimex@gmail.com",
  role: "Exporter",
  company_name: "Sogimex",
  first_name: "Carlos",
  last_name: "Ghosn",
  phone_number: PHONE.sample,
  password: "123456"
  )
carlos.save

puts "Creating exporter Carlos"
paula = User.new(
  email: "paula.coffeeexpress@gmail.com",
  role: "Exporter",
  company_name: "Coffee Express",
  first_name: "Paula",
  last_name: "Petita",
  phone_number: PHONE.sample,
  password: "123456"
  )
paula.save

puts "Creating exporter Juan"
juan = User.new(
  email: "juan.coffeelombia@gmail.com",
  role: "Exporter",
  company_name: "COffeeLOMBIA",
  first_name: "Juan",
  last_name: "Philippos",
  phone_number: PHONE.sample,
  password: "123456"
  )
juan.save

puts "Creating user louis"
louis = User.new(
  email: "louis@gmail.com",
  role: "Trader",
  company_name: "Ecom",
  first_name: "louis",
  last_name: "Dubois",
  phone_number: PHONE.sample,
  password: "123456"
  )
louis.save

puts "Creating 3 clients"
puts " client Starbucks"
  firstuser = User.new(
    email: "thibaut.starbucks@gmail.com",
    role: "Client",
    company_name: "Starbucks",
    first_name: "Thibaut",
    last_name: "Salle",
    phone_number: "2401 Utah Avenue South, Seattle, WA, USA",
    password: "123456"
    )
  firstuser.save

puts " client Nestlé"
  seconduser = User.new(
    email: "rodrigue.nestle@gmail.com",
    role: "Client",
    company_name: "Nestlé",
    first_name: "Rodrigue",
    last_name: "de Poix",
    phone_number: "Avenue Nestlé 55, 1800 Vevey, Switzerland, CH",
    password: "123456"
    )
  seconduser.save


puts " client café Richard"
  thirduser = User.new(
    email: "sasha.cafe.richard@gmail.com",
    role: "Client",
    company_name: "Café Richard",
    first_name: "Sacha",
    last_name: "Koverk",
    phone_number: "5 Boulevard du Pré Biollat, 74200 Anthy-sur-Léman, FR",
    password: "123456"
    )
  thirduser.save

  puts " creation of 3 coffeelots"

  puts "   creating coffeelot 1"
  coffeelot1 = CoffeeLot.new(
      provenance: "Colombia",
      quantity: 1280,
      tree: "Arabica",
      iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
      screen_size: 18,
      cup_profile: "good cup",
      region: "Huila",
      quality_description: "Supremo UGQ"
      )
    coffeelot1.save

  puts "      Creating certifications for this coffeelot"

      coffeecertif1 = CoffeeCertification.new(coffee_lot: coffeelot1, certification: Certification.find_by(name: 'RFA'))
      coffeecertif1.save

      coffeecertif2 = CoffeeCertification.new(coffee_lot: coffeelot1, certification: Certification.find_by(name: 'Organic'))
      coffeecertif2.save

  puts "         Creating samples pending for this coffeelot"
    sample1 = Sample.new(
      stage: "Offer Sample",
      exporter: juan,
      trader: louis,
      coffee_lot: coffeelot1,
      status: "pending"
      )
    sample1.save


    puts "   creating  coffeelot 2"
coffeelot2 = CoffeeLot.new(
    provenance: "Burundi",
    quantity: 640,
    tree: "Arabica",
    iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
    screen_size: 12,
    cup_profile: "Specialty",
    region: "Kayanza",
    quality_description: "Fully Washed A"
    )
coffeelot2.save

  puts "      Creating certifications for this coffeelot"
      coffeecertif1 = CoffeeCertification.new(coffee_lot: coffeelot2, certification: Certification.find_by(name: 'UTZ'))
      coffeecertif1.save

      coffeecertif2 = CoffeeCertification.new(coffee_lot: coffeelot2, certification: Certification.find_by(name: 'Organic'))
      coffeecertif2.save


  puts "         Creating samples pending for this coffeelot"
    sample2 = Sample.new(
      stage: "Offer Sample",
      exporter: paula,
      trader: louis,
      coffee_lot: coffeelot2,
      status: "pending"
      )
    sample2.save

  #puts "                Creating potential client list for this coffeelot"
    #rand(1..3).times do
     # potclient = PotentialClient.new(coffee_lot: coffeelot2, client: User.where(role: "Client").first(User.where(role: "Client").count).sample)
    #  potclient.save
   # sample.save
  #end

 puts "   creating coffeelot 3"
coffeelot3 = CoffeeLot.new(
    provenance: "Honduras",
    quantity: 960,
    tree: "Arabica",
    iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
    screen_size: 14,
    cup_profile: "Fine Cup",
    region: "Marcala",
    quality_description: "Strictly High Grown"
    )
  coffeelot3.save

  puts "      Creating certifications for this coffeelot"
      coffeecertif1 = CoffeeCertification.new(coffee_lot: coffeelot3, certification: Certification.find_by(name: 'Fairtrade'))
      coffeecertif1.save

      coffeecertif2 = CoffeeCertification.new(coffee_lot: coffeelot3, certification: Certification.find_by(name: 'Organic'))
      coffeecertif2.save


      puts "         Creating samples pending for this coffeelot"
        sample3 = Sample.new(
          stage: "Warehouse Sample",
          exporter: carlos,
          trader: louis,
          coffee_lot: coffeelot3,
          status: "pending"
          )
        sample3.save


  # puts "         Creating samples pending for this coffeelot"
  #   sample = Sample.new(
  #     stage: "Warehouse Sample",
  #     exporter: carlos,
  #     trader: louis,
  #     coffee_lot: coffeelot3,
  #     status: "pending"
  #     )

    puts "            Adding historic to sample status:pending"
      sample1 = Sample.new(
          stage: "Offer Sample",
          exporter: User.where(role: "Exporter").first,
          trader: User.where(role: "Trader").first,
          coffee_lot: coffeelot3,
          status: "history",
          acidity: 6,
          sweetness: 5,
          clean: 6
          )
      sample1.save

      puts "            Adding historic to sample status:pending"
        sample1 = Sample.new(
            stage: "Purchase Sample",
            exporter: User.where(role: "Exporter").first,
            trader: User.where(role: "Trader").first,
            coffee_lot: coffeelot3,
            status: "history",
            acidity: 7,
            sweetness: 6,
            clean: 6
            )
        sample1.save

      puts "            Adding historic to sample status:pending"
        sample1 = Sample.new(
            stage: "Loading Sample",
            exporter: User.where(role: "Exporter").first,
            trader: User.where(role: "Trader").first,
            coffee_lot: coffeelot3,
            status: "history",
            acidity: 6,
            sweetness: 5,
            clean: 6
            )
        sample1.save

        puts "            Adding historic to sample status:pending"
          sample1 = Sample.new(
              stage: "Port Sample",
              exporter: User.where(role: "Exporter").first,
              trader: User.where(role: "Trader").first,
              coffee_lot: coffeelot3,
              status: "history",
              acidity: 5,
              sweetness: 5,
              clean: 6
              )
          sample1.save


  #  puts "                Creating potential client list for this coffeelot"
     # potclient = PotentialClient.new(coffee_lot: coffeelot3, client: seconduser)
    #  potclient.save

    puts "                         creating sent status samples"

    puts "   creating coffeelot 4"
    coffeelot4 = CoffeeLot.new(
        provenance: "Costa Rica",
        quantity: 1280,
        tree: "Arabica",
        iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
        screen_size: 18,
        cup_profile: "good cup",
        region: "Tarrazu",
        quality_description: "Specialty Estate Coffee"
        )
      coffeelot4.save

      coffeelot5 = CoffeeLot.new(
          provenance: "Peru",
          quantity: 1280,
          tree: "Arabica",
          iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
          screen_size: 18,
          cup_profile: "Stocklot",
          region: "Macana",
          quality_description: "AB FAQ Flycrop"
          )
        coffeelot5.save

        coffeelot6 = CoffeeLot.new(
            provenance: "Kenya",
            quantity: 320,
            tree: "Arabica",
            iconumber: "#{rand(100..999)}-#{rand(1000..9999)}-#{rand(1000..9999)}",
            screen_size: 18,
            cup_profile: "SHG High Grown",
            region: "Tiger",
            quality_description: "Cherry AB"
            )
          coffeelot6.save

        sample2 = Sample.new(
          stage: STAGE.sample,
          exporter: juan,
          trader: louis,
          coffee_lot: coffeelot4,
          status: "sent",
          acidity: rand(1..10),
          sweetness: rand(1..10),
          clean: rand(1..10)
          )
        sample2.save

         puts "                Creating potential client list for coffeelot -----4------"
           potclient = PotentialClient.new(coffee_lot: coffeelot4, client: thirduser)
           potclient.save

        sample2 = Sample.new(
          stage: STAGE.sample,
          exporter: juan,
          trader: louis,
          coffee_lot: coffeelot5,
          status: "sent",
          acidity: rand(1..10),
          sweetness: rand(1..10),
          clean: rand(1..10)
          )
        sample2.save

        puts "                Creating potential client list for coffeelot -----5------"
          potclient = PotentialClient.new(coffee_lot: coffeelot5, client: firstuser)
          potclient.save

        sample2 = Sample.new(
          stage: STAGE.sample,
          exporter: paula,
          trader: louis,
          coffee_lot: coffeelot6,
          status: "sent",
          acidity: rand(1..10),
          sweetness: rand(1..10),
          clean: rand(1..10)
          )
        sample2.save

         puts "                Creating potential client list for coffeelot -----6------"
          potclient = PotentialClient.new(coffee_lot: coffeelot6, client: firstuser)
          potclient.save

  puts "...."
  puts "FINIHSHED"
