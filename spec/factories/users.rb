FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65)}

    trait :with_eras_events do
      after(:create) do |user|
        create_list(:era, 3, user: user)
        create_list(:event, 3, user: user)
      end
    end
  end
end
