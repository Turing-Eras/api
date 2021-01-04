require 'rails_helper'

RSpec.describe Mutations::Events::DeleteEvent, type: :request do
  describe '.resolve' do
    it 'can delete an event' do
      user = create(:user, :with_eras_events)
      event_id = user.events[0].id

      post graphql_path, params: { query: query(event_id) }
      result = JSON.parse(response.body)

      data = result['data']['deleteEvent']

      expect(data['id']).to eq("#{event_id}")
      expect(Event.all.count).to eq(2)
      expect(Event.where(id: event_id)).to eq([])
    end
  end

  def query(event_id)
    <<~GQL
      mutation {
        deleteEvent(input:{
            id: #{event_id}
            }){
              id
            }
          }
    GQL
  end
end
