# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#User Objects
10.times do
  User.create(
    username: Faker::Internet.username(specifier: 8),
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10)
  )
end

#Topic objects

10.times do
  Topic.create(
    title: Faker::Quote.famous_last_words
  )
end


#Post Objects
30.times do
  Post.create(
    body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    user_id: Faker::Number.within(range: 1..10),
    topic_id: Faker::Number.within(range: 1..10)
  )
end


#Upvote Objects
20.times do
  Upvote.create(
    user_id: Faker::Number.within(range: 1..10),
    post_id: Faker::Number.within(range: 1..30)
  )
end
