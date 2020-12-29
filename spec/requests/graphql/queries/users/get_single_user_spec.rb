require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query one user' do
      user = create(:user, :with_eras_events)

      post graphql_path, params: { query: query(id: user.id) }
      result = JSON.parse(response.body)

      expect(result.dig('data',
                        'getUser')).to include({
                                                 'id' => user.id.to_s,
                                                 'name' => user.name,
                                                 'email' => user.email,
                                                 'birthdate' => user.birthdate.to_s
                                               })

      expect(result['data']['getUser']['eras']).to eq(
        user.eras.map do |era|
          {
            'id' => era.id.to_s,
            'userId' => era.user_id.to_s,
            'name' => era.name.to_s,
            'startDate' => era.start_date.to_s,
            'endDate' => era.end_date.to_s,
            'color' => era.color,
            'createdAt' => era.created_at.to_s,
            'updatedAt' => era.updated_at.to_s
          }
        end
      )
    end
  end

  def query(id:)
    <<~GQL
      {
        getUser(id: #{id}) {
          id
          name
          email
          birthdate
          eras {
            id
            userId
            name
            startDate
            endDate
            color
            createdAt
            updatedAt
          }
        }
      }
    GQL
  end
end
