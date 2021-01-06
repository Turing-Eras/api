class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :week_number, presence: true
  validates_with DatesInPastValidator

  belongs_to :user
end
