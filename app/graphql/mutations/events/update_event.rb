module Mutations
  module Events
    class UpdateEvent < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :date, String, required: false
      argument :week_number, String, required: false
      argument :color, String, required: false

      type Types::EventType

      def resolve(attributes)
        event = Event.find(attributes[:id])
        event_week = attributes[:date].to_date
        user_bday = User.where(id: event[:user_id])[0].birthdate
        attributes[:week_number] = ((event_week - user_bday).to_i / 7)
        event.update(attributes)
        event
      end
    end
  end
end
