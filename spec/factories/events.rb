FactoryGirl.define do
  factory :event do
    activity { FactoryGirl.create(:activity) }
    user_id { 1 }
    latitude { Faker::Number.number(10) }
    longitude { Faker::Number.number(10) }
    time { Faker::Date.between(Date.today + 1.day, 10.days.from_now) }
    is_public {true}
  end
end
