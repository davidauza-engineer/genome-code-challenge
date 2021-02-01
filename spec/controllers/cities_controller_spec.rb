# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe '#home' do
    it 'renders :home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe '#display', vcr: { cassette_name: :failed_request } do
    before do |test|
      get :display unless test.metadata[:skip_before]
    end

    it 'calls the OpenWeather::Getter service', :skip_before do
      expect_any_instance_of(OpenWeather::Getter).to receive(:call)
      get :display
    end

    it 'assigns a HTTParty::Response object to city' do
      expect(assigns(:city).class).to eq HTTParty::Response
    end

    it 'renders the :display template' do
      expect(response).to render_template(:display)
    end
  end
end
