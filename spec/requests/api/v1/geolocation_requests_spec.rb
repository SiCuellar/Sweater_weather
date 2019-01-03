require "rails_helper"

describe 'Geolocation API' do
  it 'sends a successful response' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end

  # it 'sends a longitude and latude ' do
  #
  #   get '/api/v1/forecast?location=denver,co'
  #
  #   expect(response).to be_successful
  # end
end