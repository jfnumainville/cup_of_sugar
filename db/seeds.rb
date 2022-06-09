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
    '359 Rue Bernard, Montréal, QC H2V 1T6',
    '5333 Av. Casgrain, Montréal, QC H2T 1X3',
    '4869 Av du Parc, Montréal, QC H2V 4E7',
    '74 Av. Fairmount, Montréal, QC H2T 2M2',
    '23 Rue Bernard, Montréal, QC H2T 2J6',
    '7503 Rue St Denis, Montreal QC',
    '251 Av Percival Montreal Ouest QC',
    '11727 Rue Notre Dame E, Montreal QC',
    '3708 Rue St Hubert, Montreal QC',
    '800 Rue Gagne Lasalle QC',
    '16 Saint-Viateur, Montreal QC',
    '4107 Boulevard Saint-Laurent, Montreal QC',
    '5930 Rue Hurteau, Montreal QC',
    '6730 44 Av, Montreal QC',
    '5240 Randall Av, Montreal QC',
    '3555 Edouard-Montpetit, Montreal QC',
    '12225 Av de Saint-Castin, Montreal QC',
    '391 Rue de la Congrégation, Montreal QC',
    '5333 Avenue Casgrain, Montreal QC'
]
p admin = User.create!(name: 'Andrii',
                       email: 'andrii@gmail.com',
                       password: 'password',
                       address: '359 Rue Bernard, Montréal, QC H2V 1T6')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654368186/development/cup%20of%20sugar/andrii_tbdbeo.jpg')
admin.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
admin.save!
p admin2 = User.create!(name: 'Mark',
                        email: 'mark@gmail.com',
                        password: 'password',
                        address: '5333 Av. Casgrain, Montréal, QC H2T 1X3')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654368197/development/cup%20of%20sugar/mark_kcvy2q.jpg')
admin2.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
admin2.save!

p admin3 = User.create!(name: 'Suzanne',
                        email: 'suzanne@gmail.com',
                        password: 'password',
                        address: '4869 Av du Parc, Montréal, QC H2V 4E7')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/suzanne_x0ghzn.jpg')
admin3.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
admin3.save!
p admin4 = User.create!(name: 'Jean-Francois',
                        email: 'jf@gmail.com',
                        password: 'password',
                        address: '74 Av. Fairmount, Montréal, QC H2T 2M2')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/jfnumainville_boletg.jpg')
admin4.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
admin4.save!

p user5 = User.create!(name: 'Krystina',
                      email: 'krystina@gmail.com',
                      password: 'password',
                      address: '23 Rue Bernard, Montréal, QC H2T 2J6')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654702069/development/cup%20of%20sugar/Krystina_zeafz3.jpg')
user5.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
user5.save!

user_ids_list = User.all.pluck(:id)

puts "Creating items..."

# TO-DO: Add Cloudinary images
p tennisracket1 = Item.create!(name: "Tennis racket for young children",
                             description: "for begginers",
                             category: "Sports",
                             user_id: User.first.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/tennis_nhufry.jpg')
tennisracket1.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
tennisracket1.save!

p table_saw2 = Item.create!(name: "Table Saw",
                       description: "Great for your DIY construction projects! Decent condition.",
                       category: "Construction",
                       user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/tablesaw_vjvofk.jpg')
table_saw2.picture.attach(io: file, filename: 'football_fan.jpg', content_type: 'image/jpg')
table_saw2.save!

p party3 = Item.create!(name: "Party decoration",
                      description: "Disco mirror ball and very long colorful banner",
                      category: "Books",
                      user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/party_ftrr7y.jpg')
party3.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
party3.save!


p projector4 = Item.create!(name: "Outdoor screen for projector",
                       description: 'Great for movie night',
                       category: "Special event",
                       user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/outdoorscreen_kgngaw.jpg')
projector4.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/webp')
projector4.save!

p lugage5 = Item.create!(name: "Luggage big and very resistant",
                      description: "unbreackable, 4 wheels",
                      category: "Holidays",
                      user_id: User.last.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364890/development/cup%20of%20sugar/luggage_thkn3t.jpg')
lugage5.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
lugage5.save!

p campingchair6 = Item.create!(name: "Camping chair",
                      description: "2 chairs, color blue",
                      category: "Holidays",
                      user_id: User.second.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364740/development/cup%20of%20sugar/campingchair_kxmdjc.jpg')
campingchair6.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/webp')
campingchair6.save!

p ladder7 = Item.create!(name: "Ladder",
            description: "Big ladder, stable. I have used it a lot to paint.",
            category: "Tools",
            user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/ladder_hpjrh5.jpg')
ladder7.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
ladder7.save!

p game8 = Item.create!(name: "Game 4 connect",
  description: "Fun game. A classic. for children above 6 years old.",
  category: "Toys",
  user_id: User.second.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/game4connect_oshy9d.jpg')
game8.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
game8.save!

p game9 = Item.create!(name: "Monopoly edition India",
  description: "Fun game, for long evening",
  category: "Toys",
  user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364891/development/cup%20of%20sugar/monopolyindia_plzeis.jpg')
game9.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
game9.save

p magazines10 = Item.create!(name: "Magazines Spirou",
  description: "Cartoons in French",
  category: "Books",
  user_id: User.third.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/tablesaw_vjvofk.jpg')
magazines10.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
magazines10.save

p smoke_machine11 = Item.create!(name: "Smoke Machine",
  description: "Awesome machine to have on stage at your next show! Excellent condition",
  category: "Special event",
  user_id: User.second.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/smokemachine_gby9df.jpg')
smoke_machine11.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
smoke_machine11.save!

item_ids_list = Item.all.pluck(:id)

puts "Creating requests..."

p request = Request.create!(user_id: User.third.id, item_id: Item.first.id, start_date: Date.parse("2022-06-18"), end_date: Date.parse("2022-06-24"), status: 1)
request.save!

p request = Request.create!(user_id: User.first.id, item_id: Item.fourth.id, start_date: Date.parse("2022-06-25"), end_date: Date.parse("2022-06-27"), status: 1)
request.save!

puts "Creating Reviews..."

5.times do
  p review = Review.create!(rating: rand(1.0..5.0), description: Faker::Food.description,
                        item_id: item_ids_list.sample, user_id: user_ids_list.sample)
  review.save!
end

puts "Creating chatrooms"
5.times do
  p chatroom = Chatroom.create!(name: Faker::Food.dish)
  chatroom.save!
end

chatroom_ids_list = Chatroom.all.pluck(:id)

puts "Creating messages..."

5.times do
  p message = Message.create!(message: Faker::Food.description,
                          user_id: user_ids_list.sample, chatroom_id: chatroom_ids_list.sample)
  message.save!
end
