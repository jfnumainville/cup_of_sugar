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

p party_equipment1 = Item.new(name: "Party Equipment",
                             description: "Many plates, cups, utensils and a birthday banner.",
                             category: "Party",
                             picture: "happybirthday.jpg",
                             user_id: User.first.id)
party_equipment1.save!

p table_saw2 = Item.new(name: "Table Saw",
                       description: "Great for your DIY construction projects! Decent condition.",
                       category: "Construction",
                       picture: "tablesaw.jpg",
                       user_id: User.third.id)
table_saw2.save!

p party3 = Item.new(name: "Party decoration",
  description: "Disco mirro ball and very long colorful banner",
  category: "Books",
  picture: "party.jpg",
  user_id: User.third.id)

party3.save


p projector4 = Item.new(name: "Outdoor screen for projector",
                       description: 'Great for movie night',
                       category: "Special event",
                       picture: "outdoorscreen.jpg",
                       user_id: User.third.id)
projector4.save!

p lugage5 = Item.new(name: "Luggage big and very resistant",
                      description: "unbreackable, 4 wheels",
                      category: "Holidays",
                      picture: "luggage.jpg",
                      user_id: User.first.id)
lugage5.save!

p campingchair6 = Item.new(name: "Camping chair",
                      description: "2 chairs, color blue",
                      category: "Holidays",
                      picture: "campingchair.jpg",
                      user_id: User.second.id)
campingchair6.save!

p ladder7 = Item.new(name: "Ladder",
            description: "Big ladder, stable. I have used it a lot to paint.",
            category: "Tools",
            picture: "ladder.jpg",
            user_id: User.third.id)

ladder7.save!

p game8 = Item.new(name: "Game 4 connect",
  description: "Fun game. A classic. for children above 6 years old.",
  category: "Toys",
  picture: "game4connect.jpg",
  user_id: User.second.id)

  game8.save!

p game9 = Item.new(name: "Monopoly edition India",
  description: "Fun game, for long evening",
  category: "Toys",
  picture: "monopolyindia.jpg",
  user_id: User.third.id)

game9.save

p magazines10 = Item.new(name: "Magazines Spirou",
  description: "Cartoons in French",
  category: "Books",
  picture: "spirou.jpg",
  user_id: User.third.id)

magazines10.save

p smoke_machine11 = Item.new(name: "Smoke Machine",
  description: "Awesome machine to have on stage at your next show! Excellent condition",
  category: "Special event",
  picture: "smokemachine.jpg",
  user_id: User.second.id)
smoke_machine11.save!

item_ids_list = Item.all.pluck(:id)

puts "Creating requests..."

p request = Request.new(user_id: User.third.id, item_id: Item.first.id, start_date: Date.parse("2022-06-18"), end_date: Date.parse("2022-06-24"), status: 1)
request.save!

p request = Request.new(user_id: User.first.id, item_id: Item.fourth.id, start_date: Date.parse("2022-06-25"), end_date: Date.parse("2022-06-27"), status: 1)
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
