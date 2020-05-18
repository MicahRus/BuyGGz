counter = 0
counter_2 = 3

puts '*' * 24


puts ""
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
  profile_pic: nil,
  is_admin: true
})

puts 'Users successfully seeded ✅'

puts ""


puts 'Seeding Games'

3.times do
counter += 1
counter_2 += 1
random_price = rand(1000..15000).round(-1)
random_price_2 = rand(1000..15000).round(-1)
platforms = []
31.times do 
  platforms << Faker::Game.unique.platform
end




  game = Game.create({
    user_id: 1,
    title: Faker::Game.title,
    cost: random_price,
    platform: Faker::Game.platform,
    image: nil,
    posted_by: 'test_user_1'

  })

  game.image.attach(io: File.open("app/assets/images/pic#{counter}.jpeg"), filename: "pic#{counter}.jpeg") if game['image'].nil?

  game = Game.create({
    user_id: 2,
    title: Faker::Game.title,
    cost: random_price_2,
    platform: Faker::Game.platform,
    image: nil,
    posted_by: 'test_user_2'

  })
  game.image.attach(io: File.open("app/assets/images/pic#{counter_2}.jpeg"), filename: "pic#{counter_2}.jpeg") if game['image'].nil?



end

puts 'Games successfully seeded ✅'
puts '*' * 24