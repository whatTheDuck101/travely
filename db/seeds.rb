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
User.create(
  first_name: 'Tzvi',
  last_name: 'Hamerman',
  email: 'Tzvi@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "tzvi.png"))
)
User.create(
  first_name: 'Vinicius',
  last_name: 'Ishizaki',
  email: 'Vinicius@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "vinicius.jpeg"))
)
User.create(
  first_name: 'Elizabeth',
  last_name: 'Creary',
  email: 'Elizabeth@lewagon.com',
  password: '123456',
  photo: File.open(Rails.root.join("app", "assets", "images", "elizabeth.jpg"))
)
User.create(
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
  password: '123456'
)
borrower = User.create(
  first_name: 'Peter',
  last_name: 'Parker',
  email: 'borrower@lewagon.com',
  password: '123456'
)
puts 'done creating users'

puts 'creating stops'
Stop.create(city:"montreal", start_date:Date.new(2019,01,01), end_date:Date.new(2019,02,01), user:owner)
Stop.create(city:"toronto", start_date:Date.new(2019,02,01), end_date:Date.new(2019,03,01), user:owner)
Stop.create(city:"ottowa", start_date:Date.new(2019,03,01), end_date:Date.new(2019,04,01), user:owner)
Stop.create(city:"Bangkok", start_date:Date.new(2019,04,01), end_date:Date.new(2019,05,01), user:borrower)
puts 'done creating stops'


puts 'creating items'
Item.create(user:owner, name: 'Travel Mug', description: 'great travel mug', photo: File.open(Rails.root.join("app", "assets", "images", "travel_mug.jpg")))
Item.create(user:owner, name: 'Hiking Boots', description: 'waterproof, size 10', photo: File.open(Rails.root.join("app", "assets", "images", "hiking_boots.jpg")))
Item.create(user:owner, name: "Book: The Hitchhiker's Guide to the Galaxy", description: "Good condition, Softcover", photo: File.open(Rails.root.join("app", "assets", "images", "hitchhikers_guide_book.jpeg")))
Item.create(user:owner, name: 'Oyster Card', description: 'Oyster card for London tube, can include sim card as well!', photo: File.open(Rails.root.join("app", "assets", "images", "oyster_card.jpg")))
Item.create(user:owner, name: 'Unisex Rain Jacket', description: 'Color: Blue, waterproof, for adults', photo: File.open(Rails.root.join("app", "assets", "images", "rain_jacket.jpeg")))
Item.create(user:owner, name: 'Travel Pillow', description: 'See title :)', photo: File.open(Rails.root.join("app", "assets", "images", "travel_pillow.jpeg")))
Item.create(user:borrower, name: 'Insect Repellent', description: 'Brand is "OFF", barely used, mostly full', photo: File.open(Rails.root.join("app", "assets", "images", "insect_repellent.jpeg")))
puts 'done creating items'

puts 'creating listing'
Listing.create(item: Item.first, stop: Stop.first)
Listing.create(item: Item.first, stop: Stop.second)
Listing.create(item: Item.first, stop: Stop.third)
Listing.create(item: Item.second, stop: Stop.first)
Listing.create(item: Item.second, stop: Stop.second)
Listing.create(item: Item.second, stop: Stop.third)
Listing.create(item: Item.third, stop: Stop.first)
Listing.create(item: Item.third, stop: Stop.second)
Listing.create(item: Item.fourth, stop: Stop.first)
Listing.create(item: Item.fourth, stop: Stop.third)
Listing.create(item: Item.fifth, stop: Stop.second)
Listing.create(item: Item.all[5], stop: Stop.third)
Listing.create(item: Item.all[6], stop: Stop.fourth)
puts 'done creating listings'

puts 'creating request'
request_1 = Request.new
request_1.user = borrower
request_1.listing = Listing.first
request_1.save
puts 'done creating request'

puts 'Seeds complete!'
