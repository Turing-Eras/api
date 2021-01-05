require 'rails_helper'

RSpec.describe Mutations::Eras::UpdateEra, type: :request do
  describe '.resolve' do
    it 'updates an era' do
      user = create(:user, :with_eras_events)
      era_id = user.eras[0].id

      post graphql_path, params: { query: query(era_id) }
      result = JSON.parse(response.body)

      data = result['data']['updateEra']

      expect(data['name']).to eq('Master chambray tote bag fixie')
      expect(data['userId']).to eq(user.id.to_s)
      expect(data['startDate']).to eq('2021-01-04')
      expect(data['endDate']).to eq('2021-01-20')
      expect(data['color']).to eq('#7225f6')
    end

    def query(era_id)
      <<~GQL
        mutation {
          updateEra(input:{
              id: #{era_id}
              name: "Master chambray tote bag fixie"
              startDate: "Mon, 4 Jan 2021"
              endDate: "Mon, 20 Jan 2021"
              color: "#7225f6"
              }) {
                id
                userId
                name
                startDate
                endDate
                color
              }
            }
      GQL
    end
  end
end