# frozen_string_literal: true

module OpenWeather
  # This class is responsible for fetching the city data in the OpenWeather API.
  class Fetcher < BaseService
    param :city, reader: :private

    def call
      api_key = Figaro.env.open_weather_api_key!
      HTTParty.get(
        "http://api.openweathermap.org/data/2.5/weather?q=#{city},uk&APPID=#{api_key}"
      )
    end
  end
end
