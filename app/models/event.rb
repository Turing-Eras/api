class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :week_number, presence: true
  belongs_to :user
end
