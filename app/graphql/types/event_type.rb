module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :name, String, null: true
    field :date, String, null: true
    field :color, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end
