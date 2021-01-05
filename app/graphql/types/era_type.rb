module Types
  class EraType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :name, String, null: true
    field :start_date, String, null: true
    field :end_date, String, null: true
    field :week_number, String, null: true
    field :color, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end
