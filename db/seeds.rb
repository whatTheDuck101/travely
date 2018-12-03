# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'emptying database'
Request.delete_all
Listing.delete_all
Stop.delete_all
Item.delete_all
User.delete_all

puts 'creating users'
tzvi = User.create(
  first_name: 'Tzvi',
  last_name: 'Hamerman',
  email: 'Tzvi@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "tzvi.png"))
)
vini = User.create(
  first_name: 'Vinicius',
  last_name: 'Ishizaki',
  email: 'Vinicius@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "vinicius.jpeg"))
)
eliz = User.create(
  first_name: 'Elizabeth',
  last_name: 'Creary',
  email: 'Elizabeth@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "elizabeth.jpg"))
)
songyi = User.create(
  first_name: 'Songyi',
  last_name: 'Han',
  email: 'Songyi@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "songyi.jpeg"))
)
alice = User.create(
  first_name: 'Alice',
  last_name: 'Fisher',
  email: 'alice@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "alice.jpg"))
)
evan = User.create(
  first_name: 'Evan',
  last_name: 'Davies',
  email: 'evan@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "evan.jpeg"))
)

puts 'done creating users'

puts 'creating stops'
evan_copenhagen_stop = Stop.create(city:"copenhagen", start_date:Date.new(2018,11,29), end_date:Date.new(2018,12,07), user:evan, photo: File.open(Rails.root.join("app", "assets", "images", "copenhagen.jpeg")))
tzvi_copenhagen_stop = Stop.create(city:"copenhagen", start_date:Date.new(2018,12,01), end_date:Date.new(2018,12,31), user:tzvi, photo: File.open(Rails.root.join("app", "assets", "images", "copenhagen.jpeg")))
alice_copenhagen_stop = Stop.create(city:"copenhagen", start_date:Date.new(2018,12,05), end_date:Date.new(2018,12,14), user:alice, photo: File.open(Rails.root.join("app", "assets", "images", "copenhagen.jpeg")))

eliz_paris_stop = Stop.create(city:"paris", start_date:Date.new(2018,12,10), end_date:Date.new(2018,12,31), user:eliz, photo: File.open(Rails.root.join("app", "assets", "images", "paris.jpeg")))
evan_paris_stop = Stop.create(city:"paris", start_date:Date.new(2018,12,07), end_date:Date.new(2018,12,10), user:evan, photo: File.open(Rails.root.join("app", "assets", "images", "paris.jpeg")))
vini_paris_stop = Stop.create(city:"paris", start_date:Date.new(2018,12,1), end_date:Date.new(2018,12,22), user:vini, photo: File.open(Rails.root.join("app", "assets", "images", "paris.jpeg")))

alice_amsterdam_stop = Stop.create(city:"amsterdam", start_date:Date.new(2018,12,14), end_date:Date.new(2019,01,05), user:evan, photo: File.open(Rails.root.join("app", "assets", "images", "amsterdam.jpeg")))
evan_amsterdam_stop = Stop.create(city:"amsterdam", start_date:Date.new(2018,12,11), end_date:Date.new(2018,12,20), user:evan, photo: File.open(Rails.root.join("app", "assets", "images", "amsterdam.jpeg")))

songyi_barcelona_stop = Stop.create(city:"barcelona", start_date:Date.new(2018,12,19), end_date:Date.new(2018,12,30), user:eliz, photo: File.open(Rails.root.join("app", "assets", "images", "barcelona.jpeg")))
evan_barcelona_stop = Stop.create(city:"barcelona", start_date:Date.new(2018,12,21), end_date:Date.new(2018,12,30), user:evan, photo: File.open(Rails.root.join("app", "assets", "images", "barcelona.jpeg")))
puts 'done creating stops'

puts 'creating items'
ski_poles_item = Item.create(user:tzvi, name: 'Ski Poles', description: 'Used mainly for hiking but also good for sking', photo: File.open(Rails.root.join("app", "assets", "images", "ski_poles.jpg")))
bag_hiking_item = Item.create(user:tzvi, name: 'Bookbag', description: "This bag has travelled the world, and now it's time to pass it on.
", photo: File.open(Rails.root.join("app", "assets", "images", "bag3.jpg")))
extra_clothes_item = Item.create(user:tzvi, name: 'Whole outfit + shoes + some sun glasses', description: 'Got too much stuff to pack, everything is in pretty decent condition', photo: File.open(Rails.root.join("app", "assets", "images", "extra_clothes.jpg")))
thermos_item = Item.create(user:tzvi, name: 'Thermos', description: 'Keeps thinsg warm despite being so cold', photo: File.open(Rails.root.join("app", "assets", "images", "thermos.jpg")))


mittens_item = Item.create(user:alice, name: 'Mittens', description: 'Cosy and warm', photo: File.open(Rails.root.join("app", "assets", "images", "mittens.jpg")))
travel_mug_item = Item.create(user:alice, name: 'Travel Mug', description: 'stainless steel travel mug', photo: File.open(Rails.root.join("app", "assets", "images", "mug.jpg")))
hiking_boots_item = Item.create(user:alice, name: 'Men Winter Boots', description: 'waterproof, size 10, for men', photo: File.open(Rails.root.join("app", "assets", "images", "winter_boots.jpg")))
insect_repellent_item = Item.create(user:alice, name: 'Insect Repellent', description: 'Brand is "OFF", barely used, mostly full', photo: File.open(Rails.root.join("app", "assets", "images", "repellent.jpg")))
towel_item = Item.create(user:alice, name: 'Beach Towel', description: "Good for summer, and can't pack it", photo: File.open(Rails.root.join("app", "assets", "images", "towel.jpg")))

paris_museum_pass_item = Item.create(user:eliz, name: 'Paris Museum Pass', description: "You can visit any Museum in Paris for free within a 6 day span. I'm leaving Paris earlier than I thought, I hope someone will benefit from this free pass! :)", photo: File.open(Rails.root.join("app", "assets", "images", "paris_museum_pass.jpg")))
womens_rain_boots_item = Item.create(user:eliz, name: 'Rainboots for Women', description: "Man this place is rainy and my bag is stuffed, dont' want to throw them away", photo: File.open(Rails.root.join("app", "assets", "images", "women_rain_boots1.jpg")))
scarf_pile_item = Item.create(user:eliz, name: 'Too many scarves', description: "High quality, keeps warm", photo: File.open(Rails.root.join("app", "assets", "images", "scarf_pile.jpg")))
plants_1_item = Item.create(user:eliz, name: 'Succulent', description: "Can't bring back this bad boy.", photo: File.open(Rails.root.join("app", "assets", "images", "plant1.jpg")))
clothes_item = Item.create(user:eliz, name: 'Nice shirts', description: "Fine material, colors go well with everyone", photo: File.open(Rails.root.join("app", "assets", "images", "clothes.jpg")))


flashlight_item = Item.create(user:evan, name: 'Travel Flashlight', description: "Usefull for campers and night trekkers.", photo: File.open(Rails.root.join("app", "assets", "images", "flashlight.jpg")))
european_plug_item = Item.create(user:evan, name: 'European USB Plug', description: "Good travel usb plug", photo: File.open(Rails.root.join("app", "assets", "images", "european_plug.jpg")))
travel_pillow_item = Item.create(user:evan, name: 'Travel Pillow', description: 'Very comfy Travel Pillow', photo: File.open(Rails.root.join("app", "assets", "images", "travel_pillow.jpg")))
mens_boots_item = Item.create(user:evan, name: 'Mens Boots', description: 'size 13, waterproof', photo: File.open(Rails.root.join("app", "assets", "images", "hiking_boot2.jpg")))
toiletry_bag_item = Item.create(user:evan, name: 'SIS Toiletry Bag', description: "Leather Toiletry bag, superb condition, well made.", photo: File.open(Rails.root.join("app", "assets", "images", "toiletry_bag.jpg")))
book_harry_potter_philosopher_item = Item.create(user:evan, name: "Harry Potter and the Philosopher's Stone
", description: 'Hardcover, good condition', photo: File.open(Rails.root.join("app", "assets", "images", "book_harry_potter_philosopher.jpg")))
sim_card_item = Item.create(user:evan, name: 'Sim Card', description: 'Still good for the month!', photo: File.open(Rails.root.join("app", "assets", "images", "sim_card.jpg")))
headphone_item = Item.create(user:evan, name: 'Headphones', description: "Great condition, Sennheiser 280. Just got new headphones, don't need them anymore.", photo: File.open(Rails.root.join("app", "assets", "images", "headphones.jpeg")))
spain_guidebook_item = Item.create(user:evan, name: 'Spain Guide Book', description: "Lonely Planet guide book, includes spanish phrasebook.", photo: File.open(Rails.root.join("app", "assets", "images", "spain_guide_book.png")))
travel_guitar_item = Item.create(user:evan, name: 'Travel Guitar', description: "Taylor travel guitar, really good sound for it's size.", photo: File.open(Rails.root.join("app", "assets", "images", "travel_guitar.jpg")))
waterproof_pouch_item = Item.create(user:evan, name: 'Waterproof Pouch for Samsung', description: "Very good quality waterproof bag. I made a lot of memories with this :)", photo: File.open(Rails.root.join("app", "assets", "images", "waterproof_travel_pouch.jpg")))


umbrella_item = Item.create(user:vini, name: 'Umbrella', description: "Really comes in handy in the Paris rain. Too big for the plane ride back.", photo: File.open(Rails.root.join("app", "assets", "images", "umbrella.jpg")))
book_into_the_wild_item = Item.create(user:vini, name: 'Into the Wild: Book', description: 'Really interesting bibliography about a person who gave up everything and explored the wilderness.', photo: File.open(Rails.root.join("app", "assets", "images", "book_into_the_wild.jpg")))
metro_pass_item = Item.create(user:vini, name: 'Metro Pass', description: "Leaving soon, baught too many of these things.", photo: File.open(Rails.root.join("app", "assets", "images", "metro_pass.jpg")))
bag_1_item  = Item.create(user:vini, name: 'Leather Bag', description: "Fanastic bag, but doesn't fit in the suit case.", photo: File.open(Rails.root.join("app", "assets", "images", "bag1.jpg")))
shoes_item  = Item.create(user:vini, name: 'Shoes', description: "Good for when it's not raining or cold, size 10", photo: File.open(Rails.root.join("app", "assets", "images", "shoes.jpg")))

book_hitchikers_guide_item = Item.create(user:songyi, name: "Book: The Hitchhiker's Guide to the Galaxy", description: "Good condition, softcover", photo: File.open(Rails.root.join("app", "assets", "images", "book_hitchhikers_guide.jpg")))
unisex_rain_jacket_item = Item.create(user:songyi, name: 'Unisex Rain Jacket', description: 'Color: Blue, waterproof, for adults', photo: File.open(Rails.root.join("app", "assets", "images", "rain_jacket.jpg")))
plants_2_item = Item.create(user:songyi, name: "Succulent", description: "Can't take Fredie back, the succulent.", photo: File.open(Rails.root.join("app", "assets", "images", "plants2.jpg")))
plants_3_item = Item.create(user:songyi, name: "Succulent", description: "Can't take Mercury back, the succulent.", photo: File.open(Rails.root.join("app", "assets", "images", "plants3.jpg")))
bag_2_item = Item.create(user:songyi, name: "Bag", description: "Trendy summer bag.", photo: File.open(Rails.root.join("app", "assets", "images", "bag2.jpg")))
bag_3_item = Item.create(user:songyi, name: "Bag", description: "Fantastic bag for any season.", photo: File.open(Rails.root.join("app", "assets", "images", "bag3.jpg")))


puts 'done creating items'


puts 'creating listing'
stops = Stop.all
items = Item.all

Listing.create(item: ski_poles_item, stop: tzvi_copenhagen_stop)
Listing.create(item: bag_hiking_item, stop: tzvi_copenhagen_stop)
Listing.create(item: extra_clothes_item, stop: tzvi_copenhagen_stop)
Listing.create(item: thermos_item, stop: tzvi_copenhagen_stop)

Listing.create(item: mittens_item, stop: alice_copenhagen_stop)
Listing.create(item: travel_mug_item, stop: alice_copenhagen_stop)
Listing.create(item: hiking_boots_item, stop: alice_copenhagen_stop)
Listing.create(item: insect_repellent_item, stop: alice_copenhagen_stop)
Listing.create(item: flashlight_item, stop: evan_copenhagen_stop)
Listing.create(item: european_plug_item, stop: evan_copenhagen_stop)

Listing.create(item: umbrella_item, stop: vini_paris_stop)
Listing.create(item: book_into_the_wild_item, stop: vini_paris_stop)
Listing.create(item: metro_pass_item, stop: vini_paris_stop)
Listing.create(item: bag_1_item, stop: vini_paris_stop)
Listing.create(item: shoes_item, stop: vini_paris_stop)

Listing.create(item: paris_museum_pass_item, stop: eliz_paris_stop)
Listing.create(item: womens_rain_boots_item, stop: eliz_paris_stop)
Listing.create(item: scarf_pile_item, stop: eliz_paris_stop)
Listing.create(item: plants_1_item, stop: eliz_paris_stop)
Listing.create(item: clothes_item, stop: eliz_paris_stop)


Listing.create(item: towel_item, stop: alice_amsterdam_stop)
Listing.create(item: travel_pillow_item, stop: evan_amsterdam_stop)
Listing.create(item: mens_boots_item, stop: evan_amsterdam_stop)
Listing.create(item: toiletry_bag_item, stop: evan_amsterdam_stop)
Listing.create(item: book_harry_potter_philosopher_item, stop: evan_amsterdam_stop)


Listing.create(item: book_hitchikers_guide_item, stop: songyi_barcelona_stop)
Listing.create(item: unisex_rain_jacket_item, stop: songyi_barcelona_stop)
Listing.create(item: plants_2_item, stop: songyi_barcelona_stop)
Listing.create(item: plants_3_item, stop: songyi_barcelona_stop)
Listing.create(item: bag_2_item, stop: songyi_barcelona_stop)
Listing.create(item: bag_3_item, stop: songyi_barcelona_stop)

Listing.create(item: european_plug_item, stop: evan_barcelona_stop)
Listing.create(item: sim_card_item, stop: evan_barcelona_stop)
Listing.create(item: headphone_item, stop: evan_barcelona_stop)
Listing.create(item: spain_guidebook_item, stop: evan_barcelona_stop)
Listing.create(item: travel_guitar_item, stop: evan_barcelona_stop)
Listing.create(item: waterproof_pouch_item, stop: evan_barcelona_stop)

puts 'done creating listings'


puts 'Seeds complete!'
