require 'rails_helper'

RSpec.describe Mutations::Events::CreateEvent, type: :request do
  describe '.resolve' do
    before :each do
      @user = create(:user)
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
      expect(data['weekNumber']).to eq('1462')
      expect(data['color']).to eq(attributes[:color])
    end

    xit "does not create an era with a start date in the future" do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        startDate: '3000-01-01',
        endDate: '2000-01-10',
        color: '#000000'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)
      
      error = result["errors"].first

      expect(Era.all.size).to eq(@eras)
      expect(error["message"]).to eq("Validation failed: Start date cannot be in the future")
    end

    xit "does not create an era with an end date in the future" do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        startDate: '2000-01-01',
        endDate: '3000-01-10',
        color: '#000000'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      error = result["errors"].first

      expect(Era.all.size).to eq(@eras)
      expect(error["message"]).to eq("Validation failed: End date cannot be in the future")
    end

    xit "does not create an era with both start and end date in the future" do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        startDate: '3000-01-01',
        endDate: '3000-01-10',
        color: '#000000'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      error = result["errors"].first

      expect(Era.all.size).to eq(@eras)
      expect(error["message"]).to eq("Validation failed: Start date cannot be in the future, End date cannot be in the future")
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
