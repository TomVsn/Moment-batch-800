# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Transportation.destroy_all
# Participant.destroy_all
# Trip.destroy_all
# User.destroy_all

# loulou = User.create(email: "loulou@gmail.com", password: "123456", first_name: "Louise", last_name: "Ouldhaddi", username: "loulou")
# pcoppy = User.create(email: "pcoppy@gmail.com", password: "123456", first_name: "Pierre", last_name: "Coppy", username: "pcoppy")
# tomtom = User.create(email: "tomtom@gmail.com", password: "123456", first_name: "Tom", last_name: "Voisin", username: "tomtom")
# mymy = User.create(email: "mymy@gmail.com", password: "123456", first_name: "Myriam", last_name: "Delbreil", username: "mymy")



# first_name = ""
# last_name = ""
# username = ""
# CATEGORIES = ['bus', 'train', 'plane', 'car', 'various', 'other']


# 10.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   username = "#{first_name}#{last_name}"
#   User.create(email: Faker::Internet.email, password: "123456", first_name: first_name, last_name: last_name, username: username)
# end

# 3.times do
#   start_date = Faker::Time.between_dates(from: '2022-03-11', to: '2022-09-30', period: :morning)
#   Trip.create(start_date: start_date, end_date: start_date + rand(1..10).days, title: Faker::Lorem.word.capitalize, description: Faker::Lorem.paragraph_by_chars, city: Faker::Address.city, user_id: User.ids.sample)
# end

# 10.times do
#   participant = Participant.new
#   participant.user = User.all.sample
#   participant.trip = Trip.all.sample
#   participant.save
# end

# Participant.all.each do |participant|
#   transportation = Transportation.new
#   transportation.participant = participant
#   transportation.price = rand(1..100)
#   transportation.destination = participant.trip.city
#   transportation.origin = Faker::Address.city
#   transportation.mean = CATEGORIES.sample
#   transportation.departure_date = participant.trip.start_date
#   transportation.arrival_date = participant.trip.start_date + 1
#   transportation.save
# end

# Trip.all.each do |trip|
#   accomodation = Accomodation.new
#   accomodation.confirmed = false
#   accomodation.url = "https://www.airbnb.fr/rooms/38378203?federated_search_id=411e7581-c232-44ee-b60e-46f2ae587aa3&source_impression_id=p3_1646215378_deB%2FC7FDvpGB8Bh%2F"
#   accomodation.picked = false
#   accomodation.trip = trip
#   accomodation.save
# end


Accomodation.all.each do |accomodation|
  Participant.all.each do |participant|
    accomodation_vote = AccomodationVote.new
    accomodation_vote.accomodation = accomodation
    accomodation_vote.participant = participant
    accomodation_vote.save
  end
end
