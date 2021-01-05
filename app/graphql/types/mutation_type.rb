module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::Users::UpdateUser

    field :update_event, mutation: Mutations::Events::UpdateEvent
    field :delete_event, mutation: Mutations::Events::DeleteEvent

    field :update_era, mutation: Mutations::Eras::UpdateEra
    field :delete_era, mutation: Mutations::Eras::DeleteEra
  end
end
