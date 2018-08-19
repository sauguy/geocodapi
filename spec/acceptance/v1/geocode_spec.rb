require 'acceptance_helper'

resource 'Geocode' do
  header 'Authorization', :authorization_header

  let(:authorization_header) do
    'Basic ' + Base64.encode64(
       ACCESS_CREDENTIALS[:login] + ':' + ACCESS_CREDENTIALS[:password]
     )
  end

  let(:geo_resolver) do
    instance_double('geo_resolver', coordinates: coord_hash)
  end

  before do
    allow_any_instance_of(V1::GeocodeController)
      .to receive(:geo_resolver).and_return(geo_resolver)
  end

  get 'v1/coordinates' do
    let(:coord_hash) do
      HashWithIndifferentAccess.new(
        { search: 'checkpoint charlie',
          address: 'Friedrichstraße 43-45, 10117 Berlin, Germany',
          latitude: '52.5074434',
          longitude: '13.3903913',
          status: 'OK' }
        )
      end

    let(:address) { 'checkpoint charlie' }
    let(:raw_post) { params.to_json }

    parameter :address, 'The address to resolve'

    example_request 'Coordinates' do
      explanation <<-HEREDOC
        <p>Get coordinates from an existing address</p>
        <p>The <code>"status"</code> field within the Geocoding response object contains the status
        of the request, and may contain debugging information to help you track down why geocoding
        is not working. The <code>"status"</code> field may contain the following values:</p>
        <ul>
        <li><code>"OK"</code> indicates that no errors occurred; the address was successfully parsed and at
        least one geocode was returned.</li>
        <li><code>"ZERO_RESULTS"</code> indicates that the geocode was successful but returned no results.
        This may occur if the geocoder was passed a non-existent <code>address</code>.</li>

        <li><code>OVER_DAILY_LIMIT</code> indicates any of the following:
        <ul>
        <li>The API key is missing or invalid.</li>
        <li>Billing has not been enabled on your account.</li>
        <li>A self-imposed usage cap has been exceeded.</li>
        <li>The provided method of payment is no longer valid (for example, a
        credit card has expired).</li>
        </ul>
        </li>
        <li><code>"OVER_QUERY_LIMIT"</code> indicates that you are over your quota.</li>
        <li><code>"REQUEST_DENIED"</code> indicates that your request was denied.</li>
        <li><code>"INVALID_REQUEST"</code> generally indicates that the query (<code>address</code>,
        <code>components</code> or <code>latlng</code>) is missing.</li>
        <li><code>"UNKNOWN_ERROR"</code> indicates that the request could not be
        processed due to a server error. The request may succeed if you
        try again.</li>
        </ul>
      HEREDOC

      expect(response_status).to eq 200
      expect(JSON.parse(response_body)).to eq coord_hash
    end
  end
end
