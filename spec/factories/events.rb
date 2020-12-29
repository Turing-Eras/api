FactoryBot.define do
  factory :event do
    name { Faker::Hipster.sentence }
    date { '2020-12-19 15:38:49' }
    color { Faker::Color.hex_color }
    association :user
  end
end
