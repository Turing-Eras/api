require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query one user' do
      user = create(:user, :with_eras_events)

      post graphql_path, params: { query: query(id: user.id) }
      result = JSON.parse(response.body)

      expect(result.dig('data',
                        'getUser')).to eq({
                                            'id' => user.id.to_s,
                                            'name' => user.name,
                                            'email' => user.email,
                                            'birthdate' => user.birthdate.to_s
                                          })
    end
  end

  def query(id:)
    <<~GQL
      {
        getUser(id: #{id}) {
          id
          name
          email
          birthdate
        }
      }
    GQL
  end
end
