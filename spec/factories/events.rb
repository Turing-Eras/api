FactoryBot.define do
  factory :event do
    name { Faker::Hipster.sentence }
    date { Faker::Date.between(from: 10.years.ago, to: Date.today) }
    week_number { Random.rand(0..52)}
    color { Faker::Color.hex_color }
    association :user
  end
end
