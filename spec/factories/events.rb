FactoryGirl.define do
  factory :event do
    activity
    user
    latitude { Faker::Number.number(10) }
    longitude { Faker::Number.number(10) }
    time { Faker::Date.between(Date.today + 1.day, 10.days.from_now) }
    is_public {true}
  end
end
