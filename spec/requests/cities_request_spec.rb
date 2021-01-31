# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /display' do
    it 'returns http success', vcr: { cassette_name: :failed_request } do
      get '/cities/display'
      expect(response).to have_http_status(:success)
    end
  end
end
