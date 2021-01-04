require 'rails_helper'

RSpec.describe Mutations::Eras::DeleteEra, type: :request do
  describe '.resolve' do
    it 'can delete an era' do
      user = create(:user, :with_eras_events)
      era_id = user.eras[0].id

      post graphql_path, params: { query: query(era_id) }
      result = JSON.parse(response.body)

      data = result['data']['deleteEra']

      expect(data['id']).to eq("#{era_id}")
      expect(Era.all.count).to eq(2)
      expect(Era.where(id: era_id)).to eq([])
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
