require 'rails_helper'

RSpec.describe Mutations::Users::CreateUser, type: :request do
  describe '.resolve' do
    it 'can create a new user' do
      post graphql_path, params: { query: query(name: 'Assassin gallant', email: 'user@email.com', birthdate: '1990-10-10') }
      result = JSON.parse(response.body)

      data = result['data']['createUser']

      expect(data['id']).to_not eq(nil)
      expect(data['id']).to be_a(String)
      expect(data['name']).to eq('Assassin gallant')
      expect(data['email']).to eq('user@email.com')
      expect(data['birthdate']).to eq('1990-10-10')
      expect(data['events']).to eq([])
      expect(data['eras']).to eq([])

      expect(User.count).to eq(1)
    end

    it 'cannot create a new user with an email that already exists' do
      create(:user, email: 'user@email.com')
      post graphql_path, params: { query: query(name: 'Assassin gallant', email: 'user@email.com', birthdate: '1990-10-10') }
      result = JSON.parse(response.body)
      
      expect(result['errors'][0]['message']).to eq('Validation failed: Email has already been taken')
    end
  end

  def query(name:, email:, birthdate:)
    <<~GQL
      mutation {
        createUser(input:{
            name: "#{name}"
            email: "#{email}"
            birthdate: "#{birthdate}"
            }){
              id
              name
              email
              birthdate
              events {
                id
              }
              eras {
                id
              }
            }
          }
    GQL
  end
end
