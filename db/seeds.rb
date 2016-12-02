# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(username: Faker::Beer.malts, password: Faker::Beer.malts)
end

10.times do |i|
  Marker.create(title: Faker::Book.title, description: Faker::Hipster.sentence, audio: Faker::Internet.url, category: Faker::Commerce.department(1), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, user_id: i)
end
