# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/home.html.erb', type: :view do
  before { render }

  it 'contains Weather App title' do
    expect(rendered).to match /Weather App/
  end

  it 'contains the Search button' do
    expect(rendered).to match /Search/
  end

  it 'contains Search for your city label' do
    expect(rendered).to match /Search for your city/
  end
end
