module V1
  class GeocodeController < ApplicationController
    def coordinates
      render json: geo_resolver.coordinates(address)
    end

    private

    def address
      params.require(:address)
    end

    def geo_resolver
      @geo_resolver ||= GeoResolver::Api.new
    end
  end
end
