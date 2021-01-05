class Question < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :question, presence: true
  validates :onboarding, inclusion: { in: [true, false] }
end
