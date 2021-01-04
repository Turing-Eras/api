require 'rails_helper'

RSpec.describe Mutations::Events::UpdateEvent, type: :request do
  describe '.resolve' do
    it 'updates a user' do
      user = create(:user, :with_eras_events)
      event_id = user.events[0].id

      post graphql_path, params: { query: query(user.id, event_id) }
      result = JSON.parse(response.body)

      data = result['data']['updateEvent']

      expect(data['user_id']).to eq(user.id)
      expect(data['name']).to eq('Paleo gluten-free aesthetic everyday farm-to-table slow-carb distillery.')
      expect(data['date']).to eq('Sat, 19 Dec 2020 15:38:49.000000000 UTC +00:00')
      expect(data['color']).to eq('#26e840')
    end

    def query(user_id, event_id)
      <<~GQL
        mutation {
          updateEvent(input:{
              id: #{event_id}
              user_id: #{user_id}
              name: "Paleo gluten-free aesthetic everyday farm-to-table slow-carb distillery."
              date: "Sat, 19 Dec 2020 15:38:49.000000000 UTC +00:00"
              color: "#26e840"
              }) {
                id
                user_id
                name
                date
                color
              }
            }
      GQL
    end
  end
end
