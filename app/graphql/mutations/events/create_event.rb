module Mutations
  module Events
    class CreateEvent < Mutations::BaseMutation
      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :date, String, required: true
      argument :color, String, required: true

      type Types::EventType

      def resolve(attributes)
        event_week = attributes[:date].to_date
        user_bday = User.where(id: attributes[:user_id])[0].birthdate
        attributes[:week_number] = ((event_week - user_bday).to_i / 7)
        Event.create!(attributes)
      end
    end
  end
end
