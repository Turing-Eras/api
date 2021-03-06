require 'rails_helper'

RSpec.describe Mutations::Events::UpdateEvent, type: :request do
  describe '.resolve' do
    it 'updates a user' do
      user = create(:user, :with_eras_events, birthdate: '1991-12-19')
      event_id = user.events[0].id

      post graphql_path, params: { query: query(event_id) }
      result = JSON.parse(response.body)

      data = result['data']['updateEvent']

      expect(data['name']).to eq('Paleo gluten-free aesthetic everyday farm-to-table slow-carb distillery.')
      expect(data['date']).to eq('2020-12-19')
      expect(data['weekNumber']).to eq(1513)
      expect(data['color']).to eq('#26e840')
    end

    def query(id)
      <<~GQL
        mutation {
          updateEvent(input:{
              id: #{id}
              name: "Paleo gluten-free aesthetic everyday farm-to-table slow-carb distillery."
              date: "Sat, 19 Dec 2020"
              color: "#26e840"
              }) {
                id
                name
                date
                weekNumber
                color
              }
            }
      GQL
    end
  end
end
