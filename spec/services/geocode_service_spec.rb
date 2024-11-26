require 'rails_helper'
require "#{::Rails.root}/app/services/geocode_service"

RSpec.describe GeocodeService, type: :service, vcr: true do
  describe '#search_address' do
    let(:address) { "1368 Versailles Ave, Alameda, CA" }

    subject(:search_address) do
      described_class.call(address)
    end

    it 'fetches the the address coordinates' do
      VCR.use_cassette('search_address') do
        expect(search_address.latitude).to eq 37.76087029999999
        expect(search_address.longitude).to eq -122.23680482327845
      end
    end

    it 'fails validation when lat is missing from payload' do
      VCR.use_cassette('geocoder_fails_validation') do
        expect{ search_address }.to raise_error(GeocoderServiceError) 
      end
    end
  end
end
