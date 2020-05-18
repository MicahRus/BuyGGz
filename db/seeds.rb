
counter = 0
counter_2 = 3
counter_3 =1
random_platform = rand(1..30)

@platforms = [
  "macOS", "Game Boy Advance", "Xbox One", "Xbox", "Windows", "Nintendo DS", "GameCube", "Nintendo 64", "PlayStation Portable", "Game Gear", "PlayStation 2", "Nintendo DSi", "Sega Master System", "Super Nintendo Entertainment System", "Virtual Boy", "Wii", "Xbox 360", "Game Boy", "PlayStation 3", "PlayStation 4", "PlayStation Vita", "Game Boy Color", "Linux", "Sega Dreamcast", "Sega Genesis", "Nintendo Entertainment System", "Nintendo Switch", "Wii U", "Nintendo 3DS", "PlayStation", "Sega Saturn"
]


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

10.times do 
  User.create({
    username: Faker::Restaurant.unique.name,
    email: "#{Faker::Artist.unique.name}@gmail.com",
    password: "password",
    profile_pic: nil,
    is_admin: false
  })
end

puts 'Users successfully seeded ✅'

puts ""


puts 'Seeding Games'

3.times do
counter += 1
counter_2 += 1
random_price = rand(1000..15000).round(-1)
random_price_2 = rand(1000..15000).round(-1)



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

  9.times do 
    20.times do 
    random_price = rand(1000..15000).round(-1)
      Game.create({
        user_id: counter_3,
        title: Faker::Game.unique.title,
        cost: random_price,
        platform: @platforms[rand(1..30)],
        image: nil,
        posted_by: User.find(counter_3).username
      })
    end
      counter_3 += 1
  end




puts 'Games successfully seeded ✅'
puts '*' * 24