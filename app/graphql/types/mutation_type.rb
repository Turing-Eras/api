module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :delete_era, mutation: Mutations::Eras::DeleteEra
  end
end
