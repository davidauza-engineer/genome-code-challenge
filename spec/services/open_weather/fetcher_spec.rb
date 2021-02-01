# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpenWeather::Fetcher do
  let(:instance) { described_class.new('New York, New York, US') }

  describe '#initialize' do
    context 'with correct params' do
      it 'creates an instance of the class' do
        expect(instance.class).to eq described_class
      end
    end

    context 'with wrong params' do
      it 'raises an ArgumentError when called with no arguments' do
        expect { described_class.new }.to raise_error ArgumentError
      end
    end
  end

  describe '#call' do
    context 'with correct data' do
      it 'returns the data for the given city', vcr: { cassette_name: :successful_request } do
        expect(instance.call['cod']).to eq 200
      end
    end

    context 'with wrong data', vcr: { cassette_name: :failed_request } do
      it 'returns code 400 with a blank city' do
        expect(described_class.new('').call['cod']).to eq '400'
      end

      it 'returns code 404 with a not valid city' do
        expect(described_class.new('mystring').call['cod']).to eq '404'
      end
    end
  end
end
