module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :email, String, required: false
      argument :birthdate, String, required: false

      type Types::UserType

      def resolve(attributes)
        user = User.find(attributes[:id])
        user.update(attributes)
        user
      end
    end
  end
end
