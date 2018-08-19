require 'rails_helper'

describe GeoResolver::Api do
  subject { described_class.new }

  it { expect(subject.client).to be_a GeoResolver::GoogleApi }

  describe '#coordinates' do
    let(:google_client) do
      instance_double('client', coordinates: { status: 'OK' })
    end

    let(:search) { 'checkpoint charlie' }

    before do
      allow(subject).to receive(:client).and_return(google_client)
    end

    it 'returns the result and the search string' do
      expect(subject.coordinates(search)).to include({search: search})
    end
  end
end
