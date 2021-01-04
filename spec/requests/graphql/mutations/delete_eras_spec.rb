require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display eras' do
    it 'can delete an era' do
      user = create(:user, :with_eras_events)

      post graphql_path, params: { query: query(id: user.eras[0].id) }
      result = JSON.parse(response.body)

      require "pry"; binding.pry
      data = result['data']['deleteEra']
    end
  end

  def query(era_id)
    require "pry"; binding.pry
    <<~GQL
      mutation {
        deleteEra(input:{
            id: #{era_id}
            }) {
              id
            }
          }
    GQL
  end
end
