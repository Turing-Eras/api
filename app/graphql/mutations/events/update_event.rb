module Mutations
  module Events
    class UpdateEvent < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :date, String, required: false
      argument :color, String, required: false

      type Types::EventType

      def resolve(attributes)
        event = Event.find(attributes[:id])
        event.update(attributes)
        event
      end
    end
  end
end
