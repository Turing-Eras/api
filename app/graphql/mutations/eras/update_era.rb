class Mutations::Eras::UpdateEra < ::Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :start_date, String, required: false
  argument :end_date, String, required: false
  argument :week_number, String, required: false
  argument :color, String, required: false

  type Types::EraType

  def resolve(attributes)
    era = Era.find(attributes[:id])
    start_date = attributes[:start_date].to_date
    user_bday = User.where(id: era[:user_id])[0].birthdate
    attributes[:week_number] = ((start_date - user_bday).to_i / 7 )
    era.update(attributes)
    era
  end
end
