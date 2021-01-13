require 'rails_helper'

RSpec.describe Mutations::Events::CreateEvent, type: :request do
  describe '.resolve' do
    before :each do
      @user = create(:user, birthdate: '1991-12-19')
      @events = Event.all.size
    end

    it 'creates an event' do
      attributes = {
        userId: @user.id,
        name: 'Traveled the world',
        date: '2020-01-01',
        color: '#999999'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      data = result['data']['createEvent']

      expect(Event.all.size).to eq(@events + 1)
      expect(data['userId']).to eq("#{attributes[:userId]}")
      expect(data['name']).to eq(attributes[:name])
      expect(data['date']).to eq(attributes[:date])
      expect(data['weekNumber']).to eq(1462)
      expect(data['color']).to eq(attributes[:color])
    end

    it "does not create an event with a date in the future" do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        date: '3000-01-01',
        color: '#000000'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      error = result['errors'].first

      expect(Event.all.size).to eq(@events)
      expect(error['message']).to eq('Validation failed: Date cannot be in the future')
    end

    it "creates an event with a default color" do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        date: '2000-01-01'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      data = result['data']['createEvent']

      expect(data['color']).to be_a(String)
      expect(['#F7A83E', '#A94460', '#DB4709', '#96B40D', '#E7C408', '#70D6FF', '#FF70A6', '#AA9770', '#FFD670', '#E9FF70']).to include(data['color'])
    end

    def query(attributes)
      <<~GQL
        mutation {
          createEvent(input:{
              userId: "#{attributes[:userId]}"
              name: "#{attributes[:name]}"
              date: "#{attributes[:date]}"
              color: "#{attributes[:color]}"
              }) {
                id
                userId
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
