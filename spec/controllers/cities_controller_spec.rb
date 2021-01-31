# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe '#home' do
    it 'renders :home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe '#display' do
    before { get :display }

    it 'assigns a HTTParty::Response object to city' do
      expect(assigns(:city).class).to eq HTTParty::Response
    end

    it 'renders the :display template' do
      expect(response).to render_template(:display)
    end
  end
end
