module Mutations::DateCalculator
  def self.week_number(date, user_bday)
    (date - user_bday).to_i / 7
  end
end
