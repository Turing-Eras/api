require 'rails_helper'

RSpec.describe Mutations::DateCalculator do
  describe 'class methods' do
    it 'calculates the week_number' do
      user_bday = Date.parse('Thu, 07 Jan 2021')
      date_1w = user_bday + 1.week
      date_1y = user_bday + 1.year
      date_90y = user_bday + 90.year

      week_num = Mutations::DateCalculator.week_number(date_1w, user_bday)
      expect(week_num).to eq(1)

      week_num = Mutations::DateCalculator.week_number(date_1y, user_bday)
      expect(week_num).to eq(52)

      week_num = Mutations::DateCalculator.week_number(date_90y, user_bday)
      expect(week_num).to eq(4695)
    end
  end
end
