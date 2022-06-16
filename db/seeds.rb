require "open-uri"
require "securerandom"
require "date"

puts "Destroying previous seeds..."
Category.destroy_all
Message.destroy_all
Chatroom.destroy_all
Review.destroy_all
Request.destroy_all
puts "Destroying users"
User.destroy_all
puts "destroying items"
Item.destroy_all

puts "Initiating seeding process"

puts "Adding users..."

p andrii = User.create!(name: 'Andrii',
                       email: 'andrii@gmail.com',
                       password: 'password',
                       address: '359 Rue Bernard, Montréal, QC H2V 1T6')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654368186/development/cup%20of%20sugar/andrii_tbdbeo.jpg')
andrii.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
andrii.save!

p mark = User.create!(name: 'Mark',
                        email: 'mark@gmail.com',
                        password: 'password',
                        address: '16 Saint-Viateur, Montreal QC')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654368197/development/cup%20of%20sugar/mark_kcvy2q.jpg')
mark.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
mark.save!

p suzanne = User.create!(name: 'Suzanne',
                        email: 'suzanne@gmail.com',
                        password: 'password',
                        address: '4869 Av du Parc, Montréal, QC H2V 4E7')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/suzanne_x0ghzn.jpg')
suzanne.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
suzanne.save!

p jeanfrancois = User.create!(name: 'Jean-Francois',
                        email: 'jf@gmail.com',
                        password: 'password',
                        address: '5333 Av. Casgrain, Montréal, QC H2T 1X3')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/jfnumainville_boletg.jpg')
jeanfrancois.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
jeanfrancois.save!

p krystina = User.create!(name: 'Krystina',
                      email: 'krystina@gmail.com',
                      password: 'password',
                      address: '4107 Boulevard Saint-Laurent, Montreal QC')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654702069/development/cup%20of%20sugar/Krystina_zeafz3.jpg')
krystina.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
krystina.save!

p nicolas = User.create!(name: 'Nicolas',
  email: 'nicolas@gmail.com',
  password: 'password',
  address: '7503 Rue St Denis, Montreal QC')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654963235/development/cup%20of%20sugar/nicolas_tz0cmi.jpg')
nicolas.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
nicolas.save!

p jeff = User.create!(name: 'Jeff',
  email: 'jeff@gmail.com',
  password: 'password',
  address: '3708 Rue St Hubert, Montreal QC')
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654963221/development/cup%20of%20sugar/jeff_hxj7aq.jpg')
jeff.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
jeff.save!

user_ids_list = User.all.pluck(:id)

puts "Creating items..."

p tennisracket1 = Item.create!(name: "Tennis racket for young children",
                             description: "It is good for very young children who start to play tennis",
                             category: "Sports",
                             user_id: suzanne.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/tennis_nhufry.jpg')
tennisracket1.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
tennisracket1.save!

p lugage5 = Item.create!(name: "Luggage big and very resistant",
                      description: "unbreackable, 4 wheels",
                      category: "Holidays",
                      user_id: andrii.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364890/development/cup%20of%20sugar/luggage_thkn3t.jpg')
lugage5.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
lugage5.save!

p campingchair6 = Item.create!(name: "Camping chair",
                      description: "2 chairs, color blue",
                      category: "Holidays",
                      user_id: jeff.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364740/development/cup%20of%20sugar/campingchair_kxmdjc.jpg')
campingchair6.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/webp')
campingchair6.save!

p ladder7 = Item.create!(name: "Ladder",
            description: "Big ladder, stable. I have used it a lot to paint.",
            category: "Tools",
            user_id: jeff.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/ladder_hpjrh5.jpg')
ladder7.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
ladder7.save!

p game8 = Item.create!(name: "Game 4 connect",
  description: "Fun game. A classic. for children above 6 years old.",
  category: "Toys",
  user_id: mark.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364889/development/cup%20of%20sugar/game4connect_oshy9d.jpg')
game8.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
game8.save!

p game9 = Item.create!(name: "Monopoly edition India",
  description: "Fun game, for long evening",
  category: "Toys",
  user_id: mark.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1655305318/development/8jjrl9mg040lidz4p24xz1nmuq45.jpg')
game9.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
game9.save

p magazines10 = Item.create!(name: "Magazines Spirou",
  description: "Cartoons in French",
  category: "Books",
  user_id: krystina.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364893/development/cup%20of%20sugar/spirou_m6coop.jpg')
magazines10.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
magazines10.save

p projector4 = Item.create!(name: "Outdoor screen for projector",
                       description: 'Great for movie night',
                       category: "Party",
                       user_id: andrii.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/outdoorscreen_kgngaw.jpg')
projector4.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/webp')
projector4.save!

p smoke_machine11 = Item.create!(name: "Smoke Machine",
  description: "Awesome machine to have on stage at your next show! Excellent condition",
  category: "Party",
  user_id: nicolas.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/smokemachine_gby9df.jpg')
smoke_machine11.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
smoke_machine11.save!

p table_saw2 = Item.create!(name: "Table Saw",
                       description: "Great for your DIY construction projects! Decent condition.",
                       category: "Tools",
                       user_id: suzanne.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1655393985/development/cup%20of%20sugar/tablesaw2_dai3re.jpg')
table_saw2.picture.attach(io: file, filename: 'football_fan.jpg', content_type: 'image/jpg')
table_saw2.save!

p party3 = Item.create!(name: "Party decoration",
                      description: "Disco mirror ball and very long colorful banner",
                      category: "Party",
                      user_id: nicolas.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654364892/development/cup%20of%20sugar/party_ftrr7y.jpg')
party3.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
party3.save!


p chairs = Item.create!(name: "Extra chairs",
                      description: "8 good chairs to use for your next party!",
                      category: "Party",
                      user_id: mark.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1655396551/development/cup%20of%20sugar/stacked_chairs_yilvfq.jpg')
chairs.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
chairs.save!

p fontain = Item.create!(name: "Chocolate fountain",
                      description: "Your guests will love it!",
                      category: "Party",
                      user_id: jeff.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1655396567/development/cup%20of%20sugar/fountain_z6rlhx.jpg')
fontain.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
fontain.save!

p dinnerware = Item.create!(name: "Unbreakable dinnerware",
                      description: "Good condition, cleans easily",
                      category: "Party",
                      user_id: nicolas.id)
file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1655396581/development/cup%20of%20sugar/dinnerware_d0tlkp.jpg')
dinnerware.picture.attach(io: file, filename: 'party_equipment.jpg', content_type: 'image/jpg')
dinnerware.save!


puts "Creating requests..."

p request = Request.create!(user_id: jeff.id,
                            item_id: party3.id,
                            start_date: Date.parse("2022-06-18"),
                            end_date: Date.parse("2022-06-24"),
                            status: 2)
request.save!

p request = Request.create!(user_id: krystina.id,
                            item_id: game8.id,
                            start_date: Date.parse("2022-06-25"),
                            end_date: Date.parse("2022-06-27"),
                            status: 0)
request.save!

p request = Request.create!(user_id: andrii.id,
                            item_id: chairs.id,
                            start_date: Date.parse("2022-06-21"),
                            end_date: Date.parse("2022-06-27"),
                            status: 0)
request.save!

p request = Request.create!(user_id: mark.id,
                            item_id: projector4.id,
                            start_date: Date.parse("2022-06-25"),
                            end_date: Date.parse("2022-06-27"),
                            status: 1)
request.save!

p request = Request.create!(user_id: mark.id,
                            item_id: fontain.id,
                            start_date: Date.parse("2022-06-25"),
                            end_date: Date.parse("2022-06-27"),
                            status: 0)
request.save!

p request = Request.create!(user_id: andrii.id,
                            item_id: smoke_machine11.id,
                            start_date: Date.parse("2022-06-23"),
                            end_date: Date.parse("2022-06-25"),
                            status: 2)
request.save!

p request = Request.create!(user_id: jeff.id,
                            item_id: magazines10.id,
                            start_date: Date.parse("2022-06-24"),
                            end_date: Date.parse("2022-06-29"),
                            status: 1)
request.save!

p request = Request.create!(user_id: andrii.id,
                            item_id: game9.id,
                            start_date: Date.parse("2022-06-28"),
                            end_date: Date.parse("2022-06-29"),
                            status: 1)
request.save!

p request = Request.create!(user_id: andrii.id,
                            item_id: ladder7.id,
                            start_date: Date.parse("2022-06-23"),
                            end_date: Date.parse("2022-06-27"),
                            status: 2)
request.save!

p request = Request.create!(user_id: andrii.id,
                            item_id: campingchair6.id,
                            start_date: Date.parse("2022-06-24"),
                            end_date: Date.parse("2022-06-27"),
                            status: 0)
request.save!

p request = Request.create!(user_id: jeff.id,
                            item_id: lugage5.id,
                            start_date: Date.parse("2022-06-24"),
                            end_date: Date.parse("2022-06-27"),
                            status: 0)
request.save!

puts "Creating Reviews..."

p tennis_review_1 = Review.create!(rating: 5,
                                  description: "My son who is only 3 loved the tennis racket",
                                  item_id: tennisracket1.id,
                                  user_id: nicolas.id)
tennis_review_1.save!

p table_saw_review_2= Review.create!(rating: 5,
  description: "So happy I could borrow for 5 days it from my neigboor, I have used to make a table.",
  item_id: table_saw2.id,
  user_id: jeff.id)
table_saw_review_2.save!

p magazines10_review_3= Review.create!(rating: 5,
  description: "They are very difficult to find. That is so nice of Krystina to let her neighbours read the comics.",
  item_id: magazines10.id,
  user_id: suzanne.id)
magazines10_review_3.save!


p party_review_4= Review.create!(rating: 3,
  description: "some items were broken :(",
  item_id: party3.id,
  user_id: suzanne.id)
party_review_4.save!

p ladder_review_5= Review.create!(
  rating: 5,
  description: "Exactly was I needed, communication was easy. Thank you",
  item_id: ladder7.id,
  user_id: krystina.id)
ladder_review_5.save!

p party_review_6= Review.create!(
  rating: 3,
  description: "Nicolas wasn't at home for our appointment, after he did not answer my message",
  item_id: party3.id,
  user_id: mark.id)
party_review_6.save!

p lugage_review_7= Review.create!(rating: 3,
  description: "great lugage, very light and strong.",
  item_id: lugage5.id,
  user_id: mark.id)
  lugage_review_7.save!

puts "Creating Categories"

p toys = Category.create!(name: "Toys", keywords:["toys", "nintendo", "playstation" "puzzle", "legos", "playing blocks", "playing cards"])
toys.save!

p sports = Category.create!(name: "Sports", keywords:["tennis", "racket", "net", "snow shoes", "skis", "bicycle", "skateboard", "ball", "baseball", "soccer", "football", "volleyball"])
sports.save!

p tools = Category.create!(name: "Tools", keywords:["drill", "saw", "hammer", "table saw", "screwdriver", "pliers", ])
sports.save!

p party = Category.create!(name: "Party", keywords:["disco ball", "decoration", "table", "chair", "ballons", "party", "costume", "costumes"])
sports.save!
