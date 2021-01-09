require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :date }
    it { should validate_presence_of :week_number }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
