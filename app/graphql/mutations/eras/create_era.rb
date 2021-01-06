class Mutations::Eras::CreateEra < ::Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :name, String, required: true
  argument :start_date, String, required: true
  argument :end_date, String, required: true
  argument :color, String, required: true

  type Types::EraType

  def resolve(attributes)
    start_date = attributes[:start_date].to_date
    end_date = attributes[:end_date].to_date
    user_bday = User.where(id: attributes[:user_id])[0].birthdate
    attributes[:start_week] = ((start_date - user_bday).to_i / 7)
    attributes[:end_week] = ((end_date - user_bday).to_i / 7)
    Era.create!(attributes)
  end
end
