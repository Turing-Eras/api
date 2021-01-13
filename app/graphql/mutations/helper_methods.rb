module Mutations::HelperMethods
  def self.week_number(date, user_bday)
    (date - user_bday).to_i / 7
  end

  def self.set_color
    ['#F7A83E', '#A94460', '#DB4709', '#96B40D', '#E7C408', '#70D6FF', '#FF70A6', '#AA9770', '#FFD670',
     '#E9FF70'].sample
  end
end
