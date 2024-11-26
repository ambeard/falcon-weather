require 'ostruct'

class GeocodeService 

  def self.call(address)
    response = Geocoder.search(address)
    response or raise GeocoderServiceError.new "Geocoder error"
    response.length > 0 or raise GeocoderServiceError.new "Geocoder response is empty"

    # Handle errors
    data = response.first.data
    data or raise GeocoderServiceError.new "Geocoder data error"
    data["lat"] or raise GeocoderServiceError.new "Geocoder latitude is missing"
    data["lon"] or raise GeocoderServiceError.new "Geocoder longitude is missing"
    data["address"] or raise GeocoderServiceError.new "Geocoder address is missing" 
    data["address"]["country_code"] or raise GeocoderServiceError.new "Geocoder country code is missing"

    geocode = OpenStruct.new
    geocode.latitude = data["lat"].to_f
    geocode.longitude = data["lon"].to_f
    geocode.country_code = data["address"]["country_code"]
    geocode.postal_code = data["address"]["postcode"]

    geocode
  end
end

class GeocoderServiceError < StandardError; end
