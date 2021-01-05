FactoryBot.define do
  date = Faker::Date.between(from: 10.years.ago, to: 1.year.ago)
  factory :era do
    name { Faker::Hipster.sentence }
    start_date { date }
    end_date { Faker::Date.between(from: date, to: Date.today) }
    color { Faker::Color.hex_color }
    association :user
  end
end
