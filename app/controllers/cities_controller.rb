# frozen_string_literal: true

class CitiesController < ApplicationController
  def home; end

  def display
    @city = OpenWeather::Fetcher.new(params[:city]).call
    render 'display'
  end
end
