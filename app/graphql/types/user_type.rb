module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :birthdate, String, null: true
    field :current_week, Integer, null: true
    field :events, [Types::EventType], null: false
    field :eras, [Types::EraType], null: false
  end
end
