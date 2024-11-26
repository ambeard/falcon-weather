OpenWeather::Client.configure do |config|
  config.api_key =  Rails.application.credentials.openweather_api_key
  config.user_agent = 'OpenWeather Ruby Client/1.0'
  config.units = 'standard'
  config.lang = 'en'
end

