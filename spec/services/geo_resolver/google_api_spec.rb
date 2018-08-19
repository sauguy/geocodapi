require 'rails_helper'
require 'fixtures/google_stub'

describe ::GeoResolver::GoogleApi do
  subject { described_class.new }

  describe '#coordinates' do
    context 'when the address was found' do
      let(:expected_return) do
        { address: 'Friedrichstraße 43-45, 10117 Berlin, Germany',
          latitude: '52.5074434',
          longitude: '13.3903913',
          status: 'OK' }
      end

      before do
        stub_request(:get, /#{API_CONFIGS.dig('google', 'geocode_endpoint')}/)
          .to_return(status: 200, body: VALID_RESPONSE)
      end

      it do
        expect(subject.coordinates('checkpoint charlie')).to eq expected_return
      end
    end

    context 'when the address was not found' do
      let(:expected_return) { { status: 'ZERO_RESULTS' } }

      before do
        stub_request(:get, /#{API_CONFIGS.dig('google', 'geocode_endpoint')}/)
          .to_return(status: 200, body: ZERO_RESULTS_RESPONSE)
      end

      it do
        expect(subject.coordinates('tchackpoint marty')).to eq expected_return
      end
    end
  end
end
