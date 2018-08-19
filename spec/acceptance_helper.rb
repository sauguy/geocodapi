require 'rails_helper'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = :json
  config.api_name = 'Geocode API'
  config.request_headers_to_include = ['Authorization']
  config.response_headers_to_include = []
end
