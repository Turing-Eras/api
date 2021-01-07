module Mutations
  module Events
    class DeleteEvent < Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::EventType

      def resolve(id:)
        event = Event.find(id)
        event.delete
      end
    end
  end
end
