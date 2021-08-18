# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", phone_number: '007', category: 'chinese' }
pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", phone_number: '007', category: 'italian' }
mcdo = { name: "Mcdo", address: "New York", phone_number: '007', category: 'french' }
samba_sushi = { name: "Samba Sushi", address: "Amsterdam", phone_number: '007', category: 'japanese' }
golden_dragon = { name: "Golden Dragon", address: "Kontich city", phone_number: '007', category: 'chinese' }

[ dishoom, pizza_east, mcdo, samba_sushi, golden_dragon ].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
