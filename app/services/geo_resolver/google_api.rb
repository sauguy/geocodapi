require 'net/http'

module GeoResolver
  class GoogleApi
    def coordinates(address)
      response = fetch_coordinates(address)
      return format(JSON.parse(response.body)) if response.code == '200'
      { status: response.code }
    end

    private

    def format(response)
      formatted_response = { status: response['status'] }
      return formatted_response unless formatted_response[:status] == 'OK'
      result = response['results'].first
      formatted_response.merge(
        { address: result['formatted_address'],
          latitude: result.dig('geometry', 'location', 'lat').to_s,
          longitude: result.dig('geometry', 'location', 'lng').to_s }
      )
    end

    def fetch_coordinates(address)
      uri = URI("#{endpoint}&address=#{address}")
      ::Net::HTTP.get_response(uri)
    end

    def endpoint
      "#{API_CONFIGS.dig('google', 'geocode_endpoint')}?key=#{api_key}"
    end

    def api_key
      Rails.application.credentials.geo_resolver.dig(:google, :api_key)
    end
  end
end
