class Era < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_with DatesInPastValidator

  belongs_to :user
end
