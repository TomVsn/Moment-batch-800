# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Participant.destroy_all
Trip.destroy_all
User.destroy_all

loulou = User.create(email: "loulou@gmail.com", password: "123456" first_name: "Louise", last_name: "Ouldhaddi", username: "loulou")
pcoppy = User.create(email: "pcoppy@gmail.com", password: "123456" first_name: "Pierre", last_name: "Coppy", username: "pcoppy")
tomtom = User.create(email: "tomtom@gmail.com", password: "123456" first_name: "Tom", last_name: "Voisin", username: "tomtom")
mymy = User.create(email: "mymy@gmail.com", password: "123456" first_name: "Myriam", last_name: "Delbreil", username: "mymy")


first_name = ""
last_name = ""
username = ""

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = "#{first_name}#{last_name}"
  User.create(email: Faker::Internet.email, password: "123456", first_name: first_name, last_name: last_name, username: username)
end

3.times do
  start_date = Faker::Date.between(from: '2022-03-11', to: '2022-09-30')
  Trip.create(start_date: start_date, end_date: start_date + rand(1..10), title: Faker::Lorem.word.capitalize, description: Faker::Lorem.paragraph_by_chars, city: Faker::Address.city, user_id: User.ids.sample)
end

10.times do
  participant = Participant.new
  participant.user = User.all.sample
  participant.trip = Trip.all.sample
  participant.save
end
