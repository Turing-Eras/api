require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display events' do
    it 'can query one event' do
      @user_1 = create(:user)
      create_list(:event, 3, user: @user_1)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(@user_1.events.count).to eq(3)
      
      expect(result["data"]["getEvent"]).to have_key("name")
      expect(result["data"]["getEvent"]).to have_key("date")
      expect(result["data"]["getEvent"]).to have_key("color")

      expect(result["data"]["getEvent"]["name"]).to be_a(String)
      expect(result["data"]["getEvent"]["date"]).to be_a(String)
      expect(result["data"]["getEvent"]["color"]).to be_a(String)
    end
  end

  def query
    <<~GQL
    {
      getEvent(id: "#{@user_1.events.first.id}") {
        name
        date
        color
      }
    }
    GQL
  end
end
