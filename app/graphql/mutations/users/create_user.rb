class Mutations::Users::CreateUser < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :birthdate, String, required: true

  type Types::UserType

  def resolve(attributes)
    User.create!(attributes)
  end
end
