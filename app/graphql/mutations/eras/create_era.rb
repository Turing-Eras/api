class Mutations::Eras::CreateEra < ::Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :name, String, required: false
  argument :start_date, String, required: false
  argument :end_date, String, required: false
  argument :week_number, String, required: false
  argument :color, String, required: false

  type Types::EraType

  def resolve(attributes)
    Era.create(attributes)
  end
end
