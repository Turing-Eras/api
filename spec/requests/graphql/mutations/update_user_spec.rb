require 'rails_helper'

RSpec.describe Mutations::Users::UpdateUser, type: :request do
  describe '.resolve' do
    it 'updates a user' do
      user = create(:user, :with_eras_events)

      post graphql_path, params: { query: query(user.id) }
      result = JSON.parse(response.body)

      data = result['data']['updateUser']

      expect(data['name']).to eq('Frosted Flakes Frosty')
      expect(data['email']).to eq('ice@brr.com')
      expect(data['birthdate']).to eq('2000-01-01 00:00:00 UTC')
      expect(data['eras']).to eq(user.eras.map {|era| { 'id' => era.id.to_s }})
    end

    def query(user_id)
      <<~GQL
        mutation {
          updateUser(input:{
              id: #{user_id}
              name: "Frosted Flakes Frosty"
              email: "ice@brr.com"
              birthdate: "2000-01-01"
              }) {
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
end
