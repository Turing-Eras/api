require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display events' do
    it 'can query all eventss' do
      create_list(:event, 5)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      # I think this test may be able to be moved into Leah's user spec, as I've just added Events to be queried on a user.
    end
  end

  def query
    <<~GQL
      {
        getUsers {
          id
          name
          email
          birthdate
          events {
            id
            name
            date
            color
          }
        }
      }
    GQL
  end
end