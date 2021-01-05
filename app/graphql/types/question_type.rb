module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :question, String, null: false
    field :onboarding, Boolean, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
