# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
require 'faker'

Event.destroy_all
Event.reset_pk_sequence
Era.destroy_all
Era.reset_pk_sequence
User.destroy_all
User.reset_pk_sequence
Question.destroy_all
Question.reset_pk_sequence

frosty = User.create!(name: 'Frosty', email: 'snow@brr.com', birthdate: Date.new(2001,2,3))
santa = User.create!(name: 'Nick', email: 'slay@northpole.com', birthdate: Date.new(1950,12,25))

FactoryBot.create_list(:era, 3, user: frosty)
FactoryBot.create_list(:era, 3, user: santa)

FactoryBot.create_list(:event, 3, user: frosty)
FactoryBot.create_list(:event, 3, user: santa)

Question.create!(name: 'Birthdate', question: 'When is your birthday?', onboarding: true)
Question.create!(name: 'Graducated from high school', question: 'When did you graduate high school?', onboarding: true)
Question.create!(name: 'Graduated from college', question: 'When did you graduate college?', onboarding: true)
Question.create!(name: 'Moved to current house', question: 'What is your birthday?', onboarding: true)
Question.create!(name: 'Got married', question: "If you're currently married, when were you married?", onboarding: true)
Question.create!(name: 'First job', question: 'What are the approximate dates that you started and ended your first job?', onboarding: true)
Question.create!(name: 'Best vacation', question: 'What are the dates of your most memorable vacation?', onboarding: true)