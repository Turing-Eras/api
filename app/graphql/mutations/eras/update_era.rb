require_relative '../date_calculator'

class Mutations::Eras::UpdateEra < ::Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :start_date, String, required: false
  argument :end_date, String, required: false
  argument :start_week, String, required: false
  argument :end_week, String, required: false
  argument :color, String, required: false

  type Types::EraType

  extend Mutations::DateCalculator

  def resolve(attributes)
    era = Era.find(attributes[:id])
    start_date = attributes[:start_date].to_date
    end_date = attributes[:end_date].to_date
    user_bday = User.where(id: era[:user_id])[0].birthdate
    attributes[:start_week] = Mutations::DateCalculator.week_number(start_date, user_bday)
    attributes[:end_week] = Mutations::DateCalculator.week_number(end_date, user_bday)
    era.update(attributes)
    era
  end
end
