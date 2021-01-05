class Mutations::Eras::UpdateEra < ::Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :start_date, String, required: false
  argument :end_date, String, required: false
  argument :color, String, required: false

  type Types::EraType

  def resolve(attributes)
    era = Era.find(attributes[:id])
    era.update(attributes)
    era
  end
end
