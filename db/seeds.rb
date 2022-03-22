# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding User..."
user = User.create([
  { 
    email: "user@xd.com", username: "user1",
    password: "123user", password_confirmation: "123user"
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