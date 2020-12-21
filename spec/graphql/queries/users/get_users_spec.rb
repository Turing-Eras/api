require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query all users' do
      User.create!(name: 'Frosty', email: 'snow@brr.com', birthdate: DateTime.new(2001, 2, 3))
      User.create!(name: 'Nick', email: 'slay@northpole.com', birthdate: DateTime.new(1950, 12, 25))

      result = ApiSchema.execute(query).as_json
      expect(result['data']['getUsers'].count).to eq(2)

      users = User.all
      expect(result.dig('data', 'getUsers')).to match_array(
        users.map do |user|
          { 'id' => user.id.to_s, 'name' => user.name, 'email' => user.email, 'birthdate' => user.birthdate.to_s }
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
          }
      }
    GQL
  end
end
