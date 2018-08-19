require 'rails_helper'

describe V1::GeocodeController, type: :controller do
  describe '#coordinates' do
    let(:geo_resolver) do
      instance_double('geo_resolver', coordinates: coord_hash)
    end

    before do
      allow_any_instance_of(described_class)
        .to receive(:geo_resolver).and_return(geo_resolver)

      get :coordinates, params: { address: search }
    end

    context 'when the address exists' do
      let(:search) { 'checkpoint charlie' }

      let(:coord_hash) do
        HashWithIndifferentAccess.new(
          { search: search,
            address: 'Friedrichstraße 43-45, 10117 Berlin, Germany',
            latitude: '52.5074434',
            longitude: '13.3903913',
            status: 'OK' }
        )
      end

      it do
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq coord_hash
      end
    end

    context 'when the address does not exist' do
      let(:coord_hash) do
        HashWithIndifferentAccess.new(
          { status: 'NOT_FOUND' }
        )
      end

      let(:search) { 'checkpoint marly' }

      it do
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq coord_hash
      end
    end
  end
end
