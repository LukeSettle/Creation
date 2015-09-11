FactoryGirl.define do
  factory :event do
    activity
    user
    latitude { Faker::Number.number(10) }
    longitude { Faker::Number.number(10) }
    time { Faker::Date.between(Date.today + 10.days, Date.today + 10.days) }
    is_public {true}
    address { Faker::Address.street_address }
  end
end
