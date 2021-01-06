require 'rails_helper'

RSpec.describe Mutations::Eras::CreateEra, type: :request do
  describe '.resolve' do
    before :each do
      @user = create(:user)
      @eras = Era.all.size
    end

    it 'creates an era' do
      attributes = {
        userId: @user.id,
        name: 'Summer Abroad',
        startDate: '2000-01-01',
        endDate: '2000-01-10',
        color: '#000000'
      }

      post graphql_path, params: { query: query(attributes) }
      result = JSON.parse(response.body)

      data = result['data']['createEra']

      expect(Era.all.size).to eq(@eras + 1)
      expect(data['userId']).to eq("#{attributes[:userId]}")
      expect(data['name']).to eq(attributes[:name])
      expect(data['startDate']).to eq(attributes[:startDate])
      expect(data['endDate']).to eq(attributes[:endDate])
      expect(data['color']).to eq(attributes[:color])
    end

    it "does not create an era with a start date in the future" do
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

    it "does not create an era with an end date in the future" do
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

    it "does not create an era with both start and end date in the future" do
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
          createEra(input:{
              userId: "#{attributes[:userId]}"
              name: "#{attributes[:name]}"
              startDate: "#{attributes[:startDate]}"
              endDate: "#{attributes[:endDate]}"
              color: "#{attributes[:color]}"
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
