# frozen_string_literal: true

module OpenWeather
  # This class is responsible for getting the weather information for a given
  # city either by retrieving the cached data or calling the API.
  class Getter < BaseService
    param :city, reader: :private

    def call
      city = 'null' if city.blank?
      Rails.cache.fetch(city, expires_in: 5.minutes) do
        OpenWeather::Fetcher.new(city).call
      end
    end
  end
end
