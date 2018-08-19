module GeoResolver
  class Api
    attr_reader :client

    def initialize
      @client = Object.const_get("GeoResolver::#{third_party_apis.first}").new
    end

    def coordinates(address)
      client.coordinates(address).merge(search: address)
    end

    private

    def third_party_apis
      Dir.entries(File.join(Rails.root, 'app', 'services', 'geo_resolver'))
         .select { |e| e =~ /\_api.rb$/ }
         .map { |f| f.gsub(/\.rb/, '').camelcase }
    end
  end
end
