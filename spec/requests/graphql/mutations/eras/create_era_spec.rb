require 'rails_helper'

RSpec.describe Mutations::Eras::CreateEra, type: :request do
  describe '.resolve' do
    it 'creates an era' do
      user = create(:user)
      eras = Era.all.size

      post graphql_path, params: { query: query(user.id) }
      result = JSON.parse(response.body)

      data = result['data']['createEra']

      expect(Era.all.size).to eq(eras + 1)
      expect(data['userId']).to eq("#{user.id}")
      expect(data['name']).to eq('Summer Abroad')
      expect(data['startDate']).to eq('2000-01-01')
      expect(data['endDate']).to eq('2000-01-10')
      expect(data['color']).to eq('#fh92jf')
    end

    def query(id)
      <<~GQL
        mutation {
          createEra(input:{
              userId: #{id}
              name: "Summer Abroad"
              startDate: "2000-01-01 00:00:00 UTC"
              endDate: "2000-01-10 00:00:00 UTC"
              color: "#fh92jf"
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
