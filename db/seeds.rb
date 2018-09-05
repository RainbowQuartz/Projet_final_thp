# Seed for follow and unfollow test 
require 'faker'

User.create!(first_name:  "chris",
            last_name: "dupont",
             email: "thp@thprennes.com",
             bio: "thp",
             postal_code: 35000,
             city: "Rennes", 
             country: "France",
             birthdate: "01/01/2000",
             password:              "foobar",
             password_confirmation: "foobar",
             )

99.times do |n|
  first_name  = Faker::Name.name
  last_name  = Faker::Name.name
  email = "example-#{n+1}@thprennes.com"
  password = "password"
  User.create!(first_name:  first_name,
                last_name: last_name,
                email: email,
                bio: "thp",
                postal_code: 35000,
                city: "Rennes", 
                country: "France",
                birthdate: "01/01/2000",
                password:              password,
                password_confirmation: password,
                 )
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }