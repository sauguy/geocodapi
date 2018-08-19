API_CONFIGS =
  YAML.load_file(File.join(Rails.root, 'config', 'third_party_apis.yml')).freeze

ACCESS_CREDENTIALS = {
  login: Rails.application.credentials.basic_authentication[:login],
  password: Rails.application.credentials.basic_authentication[:password]
}.freeze
