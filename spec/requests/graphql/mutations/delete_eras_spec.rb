require 'rails_helper'

RSpec.describe Mutations::Eras::DeleteEra, type: :request do
  describe '.resolve' do
    it 'can delete an era' do
      user = create(:user, :with_eras_events)

      post graphql_path, params: { query: query(user.eras[0].id) }
      result = JSON.parse(response.body)

      # require "pry"; binding.pry
      data = result['data']['deleteEra']
    end
  end

  def query(era_id)
    <<~GQL
      mutation {
        deleteEra(input:{
            id: #{era_id}
            }){
              id
            }
          }
    GQL
  end
end
