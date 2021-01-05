require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :question }
    it { should validate_presence_of :onboarding }
    it { should validate_uniqueness_of :name }
  end
end
