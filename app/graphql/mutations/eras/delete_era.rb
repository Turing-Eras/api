module Mutations
  module Eras
    class DeleteEra < ::Mutations::BaseMutation
      argument :id, ID, required: true

      type Types::EraType

      def resolve(attributes)
        era = Eras.find(attributes[:id])
        era.delete(attributes)
      end
    end
  end
end
