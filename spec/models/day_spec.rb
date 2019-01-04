require 'rails_helper'

RSpec.describe Day, type: :model do
  before(:each) do
    location = "denver,co"
    @day_data = Day.new(location)
  end

  it 'exist' do
    expect(@day_data).to be_an_instance_of(Day)
  end

  it "can contains atributes " do
    # expect(day).to eq()
  end

end
