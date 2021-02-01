# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.include CachingHelpers
end

RSpec.describe OpenWeather::Getter do
  let(:file_cache) { ActiveSupport::Cache.lookup_store(:file_store, file_caching_path) }
  let(:cache) { Rails.cache }
  let(:city) { 'New York, New York, US' }
  let(:instance) { described_class.new(city) }

  include_examples '#initialize'

  describe '#call' do
    before do
      allow(Rails).to receive(:cache).and_return(file_cache)
      Rails.cache.clear
    end

    context 'when the data has not been fetched from the API' do
      it 'calls OpenWeather::Fetcher service' do
        expect_any_instance_of(OpenWeather::Fetcher).to receive(:call)
        instance.call
      end

      it 'caches the response form the API', vcr: { cassette_name: :successful_request } do
        instance.call
        expect(cache.exist?(city)).to eq true
      end
    end

    context 'when the data has been fetched' do
      let(:response) do
        VCR.use_cassette :successful_request do
          instance.call
        end
      end

      before { response }

      it "doesn't call the OpenWeather::Fetcher service" do
        expect_any_instance_of(OpenWeather::Fetcher).not_to receive(:call)
        instance.call
      end

      it 'returns the cached version of the API response' do
        expect(instance.call.body).to match response.body
      end
    end
  end
end
