@platforms = []
31.times do 
  @platforms << Faker::Game.unique.platform
end