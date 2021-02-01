# frozen_string_literal: true

module OpenWeather
  # This class is responsible for getting the weather information for a given
  # city either by retrieving the cached data or calling the API.
  class Getter < BaseService
    param :city, reader: :private

    def call
      location = city.presence || 'null'
      Rails.cache.fetch(location, expires_in: 5.minutes) do
        OpenWeather::Fetcher.new(location).call
      end
    end
  end
end
