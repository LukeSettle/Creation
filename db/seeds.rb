Activity.create(name: "Hiking", image: 'hiking.jpg')
Activity.create(name: "Mountain Biking", image: 'mountain-biking.jpg')
Activity.create(name: "Rock Climbing", image: 'Rock-Climbing.jpg')
Activity.create(name: "Fishing", image: 'Fishing.jpg')
Activity.create(name: "Water Skiing", image: 'Water-Skiing.jpg')
Activity.create(name: "Snow Skiing", image: 'Snow-Skiing.jpg')
Activity.create(name: "Snowboarding", image: 'Snowboarding.jpg')
Activity.create(name: "Hunting", image: 'Kayaking.jpg')

100.times do
  Event.create(location: Faker::Address.street_address, time: Faker::Date.forward(100), activity_id: Faker::Number.between(1, 8), user_id: 1)
end
