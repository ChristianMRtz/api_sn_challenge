# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

puts "Seeding User..."
user = User.create([
  { 
    email: "admin", 
    username: "useradmin", 
    password: "admin", 
    password_confirmation: "admin",
    avatar: Faker::Avatar.image
  },
])
puts "Seeding Post..."
post = Post.create([
  { body: "Hi i'm posting this from my seed file", user_id: user.last.id },
])
puts "Seeding Comment..."
Comment.create([
  { body_comment: "Hi i'm commenting", user_id: user.last.id, post_id: post.last.id },
])
puts "Seeding Done!"

20.times do |index|
  User.create!(email: Faker::Internet.free_email,
               username: Faker::Internet.username,
               password: "123user",
               password_confirmation: "123user",
               avatar: Faker::Avatar.image)
end

20.times do |index|
  Post.create!(body: Faker::Lorem.sentence(word_count: 20),
               user_id: User.all.sample.id )
end

20.times do |index|
  Comment.create!(body_comment: Faker::Lorem.sentence(word_count: 20),
               user_id: User.all.sample.id,
               post_id: Post.all.sample.id)
end

10.times do |index|
  Like.create!(user_id: User.all.sample.id,
                post_id: Post.all.sample.id)
end

# 10.times do |index|
#   Dislike.create!(user_id: User.all.sample.id,
#                 post_id: Post.all.sample.id)
# end

p "Created #{User.count} Users"
p "Created #{Post.count} Posts"
p "Created #{Comment.count} Comments"