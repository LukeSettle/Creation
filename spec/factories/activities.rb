FactoryGirl.define do
  factory :activity do
    name { Faker::Name.name }
    event_id { 1 }
  end
end
