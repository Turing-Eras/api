require_relative '../helper_methods'

class Mutations::Eras::CreateEra < ::Mutations::BaseMutation
  argument :user_id, ID, required: true
  argument :name, String, required: true
  argument :start_date, String, required: true
  argument :end_date, String, required: true
  argument :color, String, required: false

  type Types::EraType

  extend Mutations::HelperMethods

  def resolve(attributes)
    start_date = attributes[:start_date].to_date
    end_date = attributes[:end_date].to_date
    user_bday = User.where(id: attributes[:user_id])[0].birthdate
    attributes[:start_week] = Mutations::HelperMethods.week_number(start_date, user_bday)
    attributes[:end_week] = Mutations::HelperMethods.week_number(end_date, user_bday)
    attributes[:color] = Mutations::HelperMethods.set_color if attributes[:color].empty?
    Era.create!(attributes)
  end
end
