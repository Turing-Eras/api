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

Event.delete_all
Era.delete_all
User.delete_all

frosty = User.create!(name: 'Frosty', email: 'snow@brr.com', birthdate: Date.new(2001,2,3))
santa = User.create!(name: 'Nick', email: 'slay@northpole.com', birthdate: Date.new(1950,12,25))

FactoryBot.create_list(:era, 3, user: frosty)
FactoryBot.create_list(:era, 3, user: santa)

FactoryBot.create_list(:event, 3, user: frosty)
FactoryBot.create_list(:event, 3, user: santa)
