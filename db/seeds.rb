require "open-uri"
require "securerandom"
require "date"

puts "Destroying previous seeds..."
Message.destroy_all
Review.destroy_all
Request.destroy_all
User.destroy_all
Item.destroy_all


puts "Initiating seeding process"

puts "Adding users..."

MILE_END_ADDRESSES = [
  "359 Rue Bernard, Montréal, QC H2V 1T6",
  "5333 Av. Casgrain, Montréal, QC H2T 1X3",
  "4869 Av du Parc, Montréal, QC H2V 4E7",
  "74 Av. Fairmount, Montréal, QC H2T 2M2",
  "23 Rue Bernard, Montréal, QC H2T 2J6"
]
p admin = User.new(name: 'Andrii',
                   email: 'andrii@gmail.com',
                   password: 'password',
                   address: MILE_END_ADDRESSES[0])
admin.save!
p admin2 = User.new(name: 'Mark',
                    email: 'mark@gmail.com',
                    password: 'password',
                    address: MILE_END_ADDRESSES[1])
admin2.save!
p admin3 = User.new(name: 'Suzanne',
                    email: 'suzanne@gmail.com',
                    password: 'password',
                    address: MILE_END_ADDRESSES[2])
admin3.save!
p admin4 = User.new(name: 'Jean-Francois',
                    email: 'jf@gmail.com',
                    password: 'password',
                    address: MILE_END_ADDRESSES[3])
admin4.save!

user_ids_list = User.all.pluck(:id)

puts "Creating items..."

p party_equipment = Item.new(name: "Party Equipment",
                             description: "Many plates, cups, utensils and a birthday banner.",
                             category: "Party",
                             picture: "happybirthday.jpg",
                             user_id: User.first.id)
party_equipment.save!

p table_saw = Item.new(name: "Table Saw",
                       description: "Great for your DIY construction projects! Decent condition.",
                       category: "Construction",
                       picture: "tablesaw.jpg",
                       user_id: User.first.id)
table_saw.save!

p smoke_machine = Item.new(name: "Smoke Machine",
                           description: "Awesome machine to have on stage at your next show! Excellent condition",
                           category: "Special event",
                           picture: "smokemachine.jpg",
                           user_id: User.second.id)
smoke_machine.save!

p projector = Item.new(name: "Outdoor screen for projector",
                       description: 'Great for movie night',
                       category: "Special event",
                       picture: "outdoorscreen.jpg",
                       user_id: User.third.id)
projector.save!

p backpack = Item.new(name: "Hiking/Travel Backpack",
                      description: "Unisex. Padded straps. Can fit alot of things (65 litres). Great for trips.",
                      category: "Holidays",
                      picture: "backpack.jpg",
                      user_id: User.third.id)
backpack.save!

item_ids_list = Item.all.pluck(:id)

puts "Creating requests..."

p request = Request.new(user_id: User.third.id, item_id: Item.first.id, start_date: Date.parse("2022-06-18"),
                        end_date: Date.parse("2022-06-24"), status: 1)
request.save!

p request = Request.new(user_id: User.first.id, item_id: Item.fourth.id, start_date: Date.parse("2022-06-25"),
                        end_date: Date.parse("2022-06-27"), status: 1)
request.save!

request_ids_list = Request.all.pluck(:id)

puts "Creating Reviews..."

5.times do
  p review = Review.new(rating: rand(1.0..5.0), description: Faker::Food.description,
                        item_id: item_ids_list.sample, user_id: user_ids_list.sample)
  review.save!
end

puts "Creating messages..."

5.times do
  p message = Message.new(message: Faker::Food.description,
                          user_id: user_ids_list.sample, request_id: request_ids_list.sample)
  message.save!
end
