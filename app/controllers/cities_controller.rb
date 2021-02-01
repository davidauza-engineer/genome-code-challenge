# frozen_string_literal: true

# This class is responsible to act as a controller for the Cities entity.
class CitiesController < ApplicationController
  def home; end

  def display
    @city = OpenWeather::Getter.new(params[:city]).call
    render 'display'
  end
end
