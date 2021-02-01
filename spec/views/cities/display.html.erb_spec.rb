# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/display.html.erb', type: :view do
  context 'with a valid city' do
    let(:city) { JSON.parse(file_fixture('city.json').read) }

    before do
      @city = city
      render
    end

    it 'displays the name of the city' do
      expect(rendered).to match(/New York/)
    end

    it 'displays the temperature' do
      expect(rendered).to match(/23.22/)
    end

    it 'displays the description' do
      expect(rendered).to match(/Cloudy/)
    end

    it 'displays the wind speed' do
      expect(rendered).to match(/19.57 mph/)
    end

    it 'displays the humidity' do
      expect(rendered).to match(/69%/)
    end

    it 'displays the visibility' do
      expect(rendered).to match(/1800 miles/)
    end
  end

  context 'without a valid city' do
    let(:city) { JSON.parse(file_fixture('city_not_found.json').read) }

    before do
      @city = city
      render
    end

    it "displays 'city not found'" do
      expect(rendered).to match(/City not found/)
    end

    it 'contains a link to try again' do
      expect(rendered).to match(/Please try again./)
    end
  end
end
