# frozen_string_literal: true

RSpec.shared_examples '#initialize' do
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
end
