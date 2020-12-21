require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display users' do
    it 'can query one user' do
      user = User.create!(id: 1, name: 'Frosty', email: 'snow@brr.com', birthdate: DateTime.new(2001, 2, 3))

      result = ApiSchema.execute(query).as_json

      expect(result.dig('data',
                        'getUser')).to eq({
                                            'id' => user.id.to_s,
                                            'name' => user.name,
                                            'email' => user.email,
                                            'birthdate' => user.birthdate.to_s
                                          })
    end
  end

  def query
    <<~GQL
      {
        getUser(id: "1") {
          id
          name
          email
          birthdate
        }
      }
    GQL
  end
end
