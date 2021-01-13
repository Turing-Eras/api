require 'rails_helper'

RSpec.describe Mutations::HelperMethods do
  describe 'class methods' do
    it 'calculates the week_number' do
      user_bday = Date.parse('Thu, 07 Jan 2021')
      date_1w = user_bday + 1.week
      date_1y = user_bday + 1.year
      date_90y = user_bday + 90.year

      week_num = Mutations::HelperMethods.week_number(date_1w, user_bday)
      expect(week_num).to eq(1)

      week_num = Mutations::HelperMethods.week_number(date_1y, user_bday)
      expect(week_num).to eq(52)

      week_num = Mutations::HelperMethods.week_number(date_90y, user_bday)
      expect(week_num).to eq(4695)
    end

    it 'picks a random hex color code' do
      expect(['#F7A83E', '#A94460', '#DB4709', '#96B40D', '#E7C408', '#70D6FF', '#FF70A6', '#AA9770', '#FFD670', '#E9FF70']).to include(Mutations::HelperMethods.set_color)
    end
  end
end
