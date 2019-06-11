# frozen_string_literal: true

User.create!(name: 'khoi',
             email: 'khoi@gmail.com',
             password: '121212',
             password_confirmation: '121212',
             created_at: Time.zone.now)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               created_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
20.times do
  title = Faker::Lorem.sentence(5)
  description = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content, title: title, description: description) }
end

# follow
users = User.all
user  = users.first
following = users[2..20]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
# follow

# like
users = User.all
user = User.first
users[3..20].each do |u|
  u.microposts.all.each { |p| user.like(p) }
  user.microposts.all.each { |p| u.like(p) }
end
# like

# comment
users = User.all
user = User.first
users[3..20].each do |u|
end
# comment
