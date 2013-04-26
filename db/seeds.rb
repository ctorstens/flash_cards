require 'faker'

# Create Users
3.times do 
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.word
    })
end

