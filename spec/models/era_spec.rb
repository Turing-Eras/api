require 'rails_helper'

RSpec.describe Era, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
