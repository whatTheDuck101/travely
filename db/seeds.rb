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
  password: '123456'
)
User.create(
  first_name: 'Vinicius',
  last_name: 'Ishizaki',
  email: 'Vinicius@lewagon.com',
  password: '123456'
)
User.create(
  first_name: 'Elizabeth',
  last_name: 'Creary',
  email: 'Elizabeth@lewagon.com',
  password: '123456'
)
User.create(
  first_name: 'Songyi',
  last_name: 'Han',
  email: 'Songyi@lewagon.com',
  password: '123456'
)
owner = User.create(
  first_name: 'Owner',
  last_name: 'Owner',
  email: 'Owner@lewagon.com',
  password: '123456'
)
borrower = User.create(
  first_name: 'Borrower',
  last_name: 'Borrower',
  email: 'borrower@lewagon.com',
  password: '123456'
)
puts 'done creating users'

puts 'creating stops'
owner.stops.build(city:"montreal", start_date:Date.new(2019,01,01), end_date:Date.new(2019,02,01))
owner.stops.build(city:"toronto", start_date:Date.new(2019,02,02), end_date:Date.new(2019,03,01))
borrower.stops.build(city:"montreal", start_date:Date.new(2019,01,01), end_date:Date.new(2019,02,01))
borrower.stops.build(city:"ottawa", start_date:Date.new(2019,02,02), end_date:Date.new(2019,03,01))
puts 'done creating stops'

puts 'creating items'
owner.items.build(name: 'travel mug', description: 'great travel mug')
owner.items.build(name: 'hiking boots', description: 'waterproof, size 10')
puts 'done creating items'

puts 'creating listing'
listing_1 = Listing.new
listing_1.stop = owner.stops.first
listing_1.item = owner.items.first
listing_1.save
listing_2 = Listing.new
listing_2.stop = owner.stops.second
listing_2.item = owner.items.second
listing_2.save
puts 'done creating listings'


puts 'done creating seeds'
puts 'good luck! dont break it'








