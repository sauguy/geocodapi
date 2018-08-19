module AuthHelper
  def basic_auth
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(
        ACCESS_CREDENTIALS[:login],
        ACCESS_CREDENTIALS[:password]
      )
  end
end
