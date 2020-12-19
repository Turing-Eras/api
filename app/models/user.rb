class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birthdate, presence: true

  has_many :eras, dependent: :destroy
  has_many :events, dependent: :destroy
end
