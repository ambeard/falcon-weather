require 'rails_helper'
require "#{::Rails.root}/app/services/open_weather_service"

RSpec.describe OpenWeatherService, type: :service, vcr: true do
  describe '#current_temperature' do
    let(:latitude) { 37.7609 }
    let(:longitude) { -122.2368 }

    subject(:current_temp) do
      described_class.call(latitude, longitude).main.temp_f
    end

    it 'fetches the current temperature' do
      VCR.use_cassette('open_weather_current_temperature') do
        expect(current_temp).to eq 54.81
      end
    end

    it 'fails validation when main is missing from payload' do
      VCR.use_cassette('open_weather_fails_validation') do
        expect{ current_temp }.to raise_error(OpenWeatherServiceError) 
      end
    end
  end
end
