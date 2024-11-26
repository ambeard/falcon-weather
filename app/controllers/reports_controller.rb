class ReportsController < ApplicationController

  def show
    @address_default = "San Francisco, CA"
    session[:address] = params[:address]
    if params[:address]
      begin
        @address = params[:address] || @address_default
        @geocode = GeocodeService.call(@address)
        # only cache this weather report if a postal code is returned
        if @geocode.postal_code
          cache_key = "#{@geocode.country_code}/#{@geocode.postal_code}"
          if Rails.cache.exist?(cache_key)
            flash.alert = "Fetched from cache."
          end
          @data = Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
            OpenWeatherService.call(@geocode.latitude, @geocode.longitude)          
          end
        else  
          @data = OpenWeatherService.call(@geocode.latitude, @geocode.longitude)
        end
      rescue => e
        flash.alert = e.message
      end        
    end
  end
end
