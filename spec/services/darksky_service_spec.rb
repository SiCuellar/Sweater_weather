require 'rails_helper'

describe DarkskyService do
  it " Gets JSON data" do
    service = DarkskyService.new
    forecast_data = service.get_forcast(39.7392358,-104.990251)

    expect(service).to be_an_instance_of(DarkskyService)

    expect(forecast_data).to be_a(Hash)
    expect(forecast_data).to have_key(:currently)
    expect(forecast_data).to have_key(:hourly)
    expect(forecast_data).to have_key(:daily)
  end
end
