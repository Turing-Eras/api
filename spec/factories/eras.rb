FactoryBot.define do
  factory :era do
    name { Faker::Hipster.sentence }
    start_date { '2020-12-19 15:37:22' }
    end_date { '2020-12-19 15:37:22' }
    color { Faker::Color.hex_color }
    association :user
  end
end
