class OpenWeatherService

  def self.call(latitude, longitude)
    data = OpenWeather::Client.new.current_weather(lat: latitude, lon: longitude)
    self.validate(data)
    data
  end

  def self.validate(data)
    raise OpenWeatherServiceError.new "Main is missing" unless data.main
  end
end

class OpenWeatherServiceError < StandardError; end

