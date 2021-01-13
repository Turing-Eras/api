require_relative '../helper_methods'

class Mutations::Events::CreateEvent < Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :name, String, required: true
  argument :date, String, required: true
  argument :color, String, required: false

  type Types::EventType

  extend Mutations::HelperMethods

  def resolve(attributes)
    event_date = attributes[:date].to_date
    user_bday = User.where(id: attributes[:user_id])[0].birthdate
    attributes[:week_number] = Mutations::HelperMethods.week_number(event_date, user_bday)
    attributes[:color] = Mutations::HelperMethods.set_color if attributes[:color].empty?
    Event.create!(attributes)
  end
end
