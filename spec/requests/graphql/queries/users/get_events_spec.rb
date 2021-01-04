require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display events' do
    it 'can query all events' do
      user_1 = create(:user, :with_eras_events)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)
      require 'pry'; binding.pry
      expect(user_1.events.count).to eq(3)
    end
  end

  def query
    <<~GQL
    {
      getEvents(userId: "1") {
        id
        name
        date
        color
      }
    }
    GQL
  end
end
