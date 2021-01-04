module Mutations
  module Eras
    class DeleteEra < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::EraType

      def resolve(id:)
        era = Era.find(id)
        era.delete
      end
    end
  end
end
