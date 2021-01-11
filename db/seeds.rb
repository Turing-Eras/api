# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

Era.create(name: 'childhood', start_date: Date.new(2001,2,3), end_date: Date.new(2011,2,3), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#ED3DC9", user: frosty)
Era.create(name: 'teens', start_date: Date.new(2012,2,3), end_date: Date.new(2020,2,3), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#02C4CC", user: frosty)
Era.create(name: 'apocalypse', start_date: Date.new(2020,3,3), end_date: Date.new(2021,1,1), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#4C0AD1", user: frosty)

Era.create(name: 'childhood', start_date: Date.new(1951,2,3), end_date: Date.new(1961,2,3), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#ED3DC9", user: santa)
Era.create(name: 'teens', start_date: Date.new(1962,2,3), end_date: Date.new(1972,2,3), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#02C4CC", user: santa)
Era.create(name: 'apocalypse', start_date: Date.new(1973,3,3), end_date: Date.new(2021,1,1), start_week: Random.rand(0..300), end_week: Random.rand(301..500), color: "#4C0AD1", user: santa)

Event.create(name: 'apocalypse', date: Date.new(2002,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: frosty)
Event.create(name: 'apocalypse', date: Date.new(2010,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: frosty)
Event.create(name: 'apocalypse', date: Date.new(2020,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: frosty)

Event.create(name: 'apocalypse', date: Date.new(1973,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: santa)
Event.create(name: 'apocalypse', date: Date.new(1983,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: santa)
Event.create(name: 'apocalypse', date: Date.new(1993,4,3), week_number: Random.rand(0..300), color: "#CB88FF", user: santa)

Question.create!(name: 'Graduated from high school', question: 'When did you graduate high school?', onboarding: true, event_type: 'event')
Question.create!(name: 'Graduated from college', question: 'When did you graduate college?', onboarding: true, event_type: 'event')
Question.create!(name: 'Moved to current house', question: 'When did you move to your current home?', onboarding: true, event_type: 'event')
Question.create!(name: 'Got married', question: "If you're currently married, when were you married?", onboarding: true, event_type: 'event')
Question.create!(name: 'First job', question: 'What are the approximate dates that you started and ended your first job?', onboarding: true, event_type: 'era')
Question.create!(name: 'Best vacation', question: 'What are the dates of your most memorable vacation?', onboarding: true, event_type: 'era')

print 'Seeding Successful!'
