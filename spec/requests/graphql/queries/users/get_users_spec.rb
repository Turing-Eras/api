require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query all users' do
      create_list(:user, 2, :with_eras_events)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result['data']['getUsers'].count).to eq(2)

      users = User.all

      expect(result.dig('data', 'getUsers')).to match_array(
        users.map do |user|
          { 'id' => user.id.to_s, 'name' => user.name, 'email' => user.email, 'birthdate' => user.birthdate.to_s, 'eras' => user.eras.map {|era| { 'id' => era.id.to_s }}}
        end
      )
    end
  end

  def query
    <<~GQL
      {
        getUsers {
          id
          name
          email
          birthdate
          eras {
            id
          }
        }
      }
    GQL
  end
end
