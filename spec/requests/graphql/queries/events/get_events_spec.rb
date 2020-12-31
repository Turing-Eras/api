require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display events' do
    it 'can query all eventss' do
      create_list(:event, 5)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

    end
  end

  def query
    <<~GQL
      {
        getEvents {
          
        }
      }

  end
end