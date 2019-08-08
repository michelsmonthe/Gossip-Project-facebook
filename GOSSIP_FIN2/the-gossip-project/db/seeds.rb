# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
10.times do
  City.create(name: Faker::Address.city, zip_code: rand(10000..99999).round(-1))
end

User.destroy_all
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Hipster.sentence, email: Faker::Internet.email, age: rand(15..60), city: City.find(rand(City.first.id..City.last.id)), password: Faker::Internet.password(min_length: 8) )
end

Tag.destroy_all
10.times do
  Tag.create(title: Faker::Hipster.word)
end

Gossip.destroy_all
20.times do
  Gossip.create(title: Faker::Hipster.paragraph_by_chars(characters: 25, supplemental: false), content: Faker::Hipster.paragraph, user: User.find(rand(User.first.id..User.last.id)), tags: [Tag.find(rand(Tag.first.id..Tag.last.id))])
end

PrivateMessage.destroy_all
25.times do
  PrivateMessage.create(content: Faker::Hipster.paragraph, from: User.find(rand(User.first.id..User.last.id)), to: User.find(rand(User.first.id..User.last.id)))
end

Comment.destroy_all
40.times do # for gossips
  Comment.create(content: Faker::Hipster.sentence, user: User.find(rand(User.first.id..User.last.id)), commentable: Gossip.find(rand(Gossip.first.id..Gossip.last.id)))
end
20.times do # for comments
  Comment.create(content: Faker::Hipster.sentence, user: User.find(rand(User.first.id..User.last.id)), commentable: Comment.find(rand(Comment.first.id..Comment.last.id)))
end

Like.destroy_all
20.times do
  Like.create(gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)), user: User.find(rand(User.first.id..User.last.id)))
end
