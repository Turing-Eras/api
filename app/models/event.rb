class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :week_number, presence: true
  validates :color, presence: true
  belongs_to :user
end
