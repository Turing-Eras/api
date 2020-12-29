FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    birthdate { '2020-12-19 15:34:36' }

    trait :with_eras_events do
      after(:create) do |user|
        create_list(:era, 3, user: user)
        create_list(:event, 3, user: user)
      end
    end
  end
end
