puts '*' * 24
puts 'Seeding Users'

User.create({
  username: "test_user_1",
  email: "Test_user_1@gmail.com",
  password: "password",
  profile_pic: nil
})

User.create({
  username: "test_user_2",
  email: "Test_user_2@gmail.com",
  password: "password",
  profile_pic: nil
})

User.create({
  username: "admin",
  email: "admin@gmail.com",
  password: "password",
  profile_pic: nil
})

puts 'Users successfully seeded ✅'


puts 'Seeding Games'


puts 'Games successfully seeded ✅'
puts '*' * 24