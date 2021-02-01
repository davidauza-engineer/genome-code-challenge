# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/display.html.erb', type: :view do
  let(:city) do
    {
      name: 'New York',
      main: {
        temp: 23.22,
        humidity: 69
      },
      weather: [
        {
          description: 'Cloudy'
        }
      ],
      wind: {
        speed: 19.57
      },
      visibility: 1800
    }.as_json
  end

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
