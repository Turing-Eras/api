require_relative '../helper_methods'

class Mutations::Events::UpdateEvent < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :date, String, required: false
  argument :color, String, required: false

  type Types::EventType

  extend Mutations::HelperMethods

  def resolve(attributes)
    event = Event.find(attributes[:id])
    event_date = attributes[:date].to_date
    user_bday = User.where(id: event[:user_id])[0].birthdate
    attributes[:week_number] = Mutations::HelperMethods.week_number(event_date, user_bday)
    event.update(attributes)
    event
  end
end
