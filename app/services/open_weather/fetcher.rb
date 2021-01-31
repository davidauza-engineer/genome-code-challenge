# frozen_string_literal: true

module OpenWeather
  class Fetcher < BaseService
    param :city, reader: :private

    def call
      HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city},uk&APPID=#{Figaro.env.open_weather_api_key!}")
    end
  end
end
