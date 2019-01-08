require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:summary)}
    it {should validate_presence_of(:temp_high)}
    it {should validate_presence_of(:temp_low)}
  end

  describe 'relationships' do
    it {should have_many(:hours) }
  end
end
