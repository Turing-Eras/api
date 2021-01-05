module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::Users::UpdateUser

    field :update_era, mutation: Mutations::Eras::UpdateEra
  end
end
