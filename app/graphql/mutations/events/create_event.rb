require_relative '../date_calculator'

class Mutations::Events::CreateEvent < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :name, String, required: true
  argument :date, String, required: true
  argument :color, String, required: false

  type Types::EventType

  extend Mutations::DateCalculator

  def resolve(attributes)
    event_date = attributes[:date].to_date
    user_bday = User.where(id: attributes[:user_id])[0].birthdate
    attributes[:week_number] = Mutations::DateCalculator.week_number(event_date, user_bday)
    Event.create!(attributes)
  end
end
