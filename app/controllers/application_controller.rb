class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ACCESS_CREDENTIALS[:login],
                               password: ACCESS_CREDENTIALS[:password]
end
