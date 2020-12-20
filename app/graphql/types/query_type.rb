module Types
  class QueryType < Types::BaseObject
    field :get_users, [Types::UserType], null: false, description: 'Returns a list of users'

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    def get_users
      User.all
    end
  end
end
