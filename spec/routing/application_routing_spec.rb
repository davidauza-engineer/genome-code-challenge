# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application routes', type: :routing do
  it 'routes / to the cities controller home action' do
    expect(get('/')).to route_to('cities#home')
  end

  it 'routes /cities/display to cities controller display action' do
    expect(get('/cities/display')).to route_to('cities#display')
  end
end
