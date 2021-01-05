module Types
  class QueryType < Types::BaseObject
    field :get_users, [Types::UserType], null: false, description: 'Returns a list of users'

    field :get_user, Types::UserType, null: false, description: 'Returns a single user by id' do
      argument :id, ID, required: true
    end

    field :get_era, Types::EraType, null: false, description: 'Returns a single era by id' do
      argument :id, ID, required: true
    end

    # Events
    field :get_event, Types::EventType, null: false, description: 'Returns a single event by id' do
      argument :id, ID, required: true
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    def get_users
      User.all
    end

    def get_user(id:)
      User.find(id)
    end

    # Eras
    def get_era(id:)
      Era.find(id)
    end

    # Event queries
    def get_event(id:)
      Event.find(id)
    end
  end
end
