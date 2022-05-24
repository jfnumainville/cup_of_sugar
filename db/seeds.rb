require "open-uri"
require "date"

puts "Destroying previous seeds..."
User.destroy_all
Request.destroy_all
Item.destroy_all
Review.destroy_all

puts "Initiating seeding process"

puts "Adding users..."

MILE_END_ADDRESSES = [
  "359 Rue Bernard O, Montréal, QC H2V 1T6",
  "5333 Av. Casgrain Suite 102, Montréal, QC H2T 1X3",
  "4869 Av du Parc, Montréal, QC H2V 4E7",
  "74 Av. Fairmount O, Montréal, QC H2T 2M2",
  "23 Rue Bernard O, Montréal, QC H2T 2J6"
]
p admin = User.create(name: 'Andrii',
                      email: 'andrii@gmail.com',
                      password: 'password',
                      address: MILE_END_ADDRESSES[0])
admin.save
p admin2 = User.create(name: 'Mark',
                       email: 'mark@gmail.com',
                       password: 'password',
                       address: MILE_END_ADDRESSES[1])
admin2.save
p admin3 = User.create(name: 'Suzanne',
                       email: 'suzanne@gmail.com',
                       password: 'password',
                       address: MILE_END_ADDRESSES[2])
admin3.save
p admin4 = User.create(name: 'Jean-Francois',
                       email: 'jf@gmail.com',
                       password: 'password',
                       address: MILE_END_ADDRESSES[3])
admin4.save

user_ids_list = User.all.pluck(:id)

puts "Creating items..."

p party_equipment = Item.create(name: "Party Equipment",
                                description: "Many plates, cups, utensils and a birthday banner.",
                                category: "Party",
                                picture: "",
                                user_id: user_ids_list.sample)
party_equipment.save

p table_saw = Item.create(name: "Table Saw",
                          description: "Great for your DIY construction projects! Decent condition.",
                          category: "Construction",
                          picture: "",
                          user_id: user_ids_list.sample)
table_saw.save

p smoke_machine = Item.create(name: "Smoke Machine",
                              description: "Awesome machine to have on stage at your next show! Excellent condition",
                              category: "Event",
                              picture: "",
                              user_id: user_ids_list.sample)
smoke_machine.save

p projector = Item.create(name: "Projector with Screen ",
                          description: '100" projector with 1080p quality! Great for movie night.',
                          category: "Home-theatre",
                          picture: "",
                          user_id: user_ids_list.sample)
projector.save

p backpack = Item.create(name: "Hiking/Travel Backpack",
                         description: "Unisex. Padded straps. Can fit alot of things (65 litres). Great for trips.",
                         category: "Travel",
                         picture: "",
                         user_id: user_ids_list.sample)
backpack.save

puts "Creating requests..."
