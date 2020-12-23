require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      describe '.resolve' do
        it 'updates a user' do
          frosty = User.create!(name: 'Frosty', email: 'snow@brr.com', birthdate: DateTime.new(2001, 2, 3))

          post graphql_path, params: {query: query(frosty.id)}
          result = JSON.parse(response.body)

          data = result['data']['updateUser']

          expect(data['name']).to eq('Frosted Flakes Frosty')
          expect(data['email']).to eq('ice@brr.com')
          expect(data['birthdate']).to eq('2000-01-01 00:00:00 UTC')
        end

        def query(user_id)
          <<~GQL
            mutation {
              updateUser(
                id: #{user_id}
                name: "Frosted Flakes Frosty"
                email: "ice@brr.com"
                birthdate: "2000-01-01"
                ) {
                id
                name
                email
                birthdate
                }
            }
          GQL
        end
      end
    end
  end
end
