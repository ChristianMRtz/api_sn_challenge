# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

puts "Deleting all data..."
Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Seeding User admin..."
user = User.create([
  { 
    email: "admin", 
    username: "admin", 
    password: "admin", 
    password_confirmation: "admin",
    avatar: Faker::Avatar.image
  },
])
puts "Seeding Admin Post..."
post = Post.create([
  { body: "Hi i'm posting this from my seed file", user_id: user.last.id },
])
puts "Seeding Admin Comment..."
Comment.create([
  { body_comment: "Hi i'm commenting", user_id: user.last.id, post_id: post.last.id },
])

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

puts "Created #{User.count} Users"
puts "Created #{Post.count} Posts"
puts "Created #{Comment.count} Comments"
puts "Created #{Like.count} Likes"
puts "Seeding Done!"

#Seeds for the database
