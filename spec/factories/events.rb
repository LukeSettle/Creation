FactoryGirl.define do
  factory :event do
    activity {Activity.first}
    location {Faker::Address.country}
    time {Faker::Date.between(Date.today, 10.days.from_now)}
    is_public {true}
  end
end
