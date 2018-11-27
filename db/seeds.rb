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
owner = User.create(
  first_name: 'Tom',
  last_name: 'Johnson',
  email: 'Owner@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "owner_profile_pic.jpeg"))
)
borrower = User.create(
  first_name: 'Peter',
  last_name: 'Parker',
  email: 'borrower@lewagon.com',
  password: '123456'
)
puts 'done creating users'

puts 'creating stops'
Stop.create(city:"zurich", start_date:Date.new(2018,12,01), end_date:Date.new(2018,12,07), user:tzvi, photo: File.open(Rails.root.join("app", "assets", "images", "zurich.jpg")))
Stop.create(city:"zurich", start_date:Date.new(2018,12,01), end_date:Date.new(2018,12,07), user:owner, photo: File.open(Rails.root.join("app", "assets", "images", "zurich.jpg")))
Stop.create(city:"paris", start_date:Date.new(2018,12,07), end_date:Date.new(2018,12,14), user:eliz, photo: File.open(Rails.root.join("app", "assets", "images", "paris.jpg")))
Stop.create(city:"bordeaux", start_date:Date.new(2018,12,14), end_date:Date.new(2018,12,30), user:vini, photo: File.open(Rails.root.join("app", "assets", "images", "bordeaux.jpg")))
puts 'done creating stops'


puts 'creating items'
Item.create(user:tzvi, name: 'Travel Mug', description: 'great travel mug', photo: File.open(Rails.root.join("app", "assets", "images", "travel_mug.jpeg")))
Item.create(user:tzvi, name: 'Hiking Boots', description: 'waterproof, size 10', photo: File.open(Rails.root.join("app", "assets", "images", "hiking_boots.jpg")))
Item.create(user:owner, name: 'Insect Repellent', description: 'Brand is "OFF", barely used, mostly full', photo: File.open(Rails.root.join("app", "assets", "images", "insect_repellent.jpeg")))
Item.create(user:owner, name: "Book: The Hitchhiker's Guide to the Galaxy", description: "Good condition, Softcover", photo: File.open(Rails.root.join("app", "assets", "images", "hitchhikers_guide_book.jpeg")))
Item.create(user:eliz, name: 'Oyster Card', description: 'Oyster card for London tube, can include sim card as well!', photo: File.open(Rails.root.join("app", "assets", "images", "oyster_card.jpg")))
Item.create(user:eliz, name: 'Unisex Rain Jacket', description: 'Color: Blue, waterproof, for adults', photo: File.open(Rails.root.join("app", "assets", "images", "rain_jacket.jpeg")))
Item.create(user:vini, name: 'Travel Pillow', description: 'See title :)', photo: File.open(Rails.root.join("app", "assets", "images", "travel_pillow.jpeg")))
Item.create(user:vini, name: 'Surfing board', description: 'almost new ! ', photo: File.open(Rails.root.join("app", "assets", "images", "board.jpg")))
puts 'done creating items'


puts 'creating listing'
stops = Stop.all
items = Item.all
Listing.create(item: items[0], stop: stops[0])
Listing.create(item: items[1], stop: stops[0])
Listing.create(item: items[2], stop: stops[1])
Listing.create(item: items[3], stop: stops[1])
Listing.create(item: items[4], stop: stops[2])
Listing.create(item: items[5], stop: stops[2])
Listing.create(item: items[6], stop: stops[3])
Listing.create(item: items[7], stop: stops[3])

puts 'done creating listings'


puts 'Seeds complete!'
