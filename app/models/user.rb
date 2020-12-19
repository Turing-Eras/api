class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true

  has_many :eras
  has_many :events
end
