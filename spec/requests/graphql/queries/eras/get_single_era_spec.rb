require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query Eras' do
    it 'can query one era' do
      user = create(:user, :with_eras_events)
      era = user.eras.first

      post graphql_path, params: { query: query(id: era.id) }
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result.dig(:data,
                        :getEra)).to eq({
                                              id: era.id.to_s,
                                              userId: era.user_id.to_s,
                                              name: era.name,
                                              startDate: era.start_date.to_s,
                                              endDate: era.end_date.to_s,
                                              startWeek: era.start_week.to_s,
                                              endWeek: era.end_week.to_s,
                                              color: era.color,
                                              createdAt: era.created_at.to_s,
                                              updatedAt: era.updated_at.to_s
                                              })
    end
  end

  def query(id:)
    <<~GQL
      {
        getEra(id: #{id}) {
          id
          userId
          name
          startDate
          endDate
          startWeek
          endWeek
          color
          createdAt
          updatedAt
        }
      }
    GQL
  end
end
