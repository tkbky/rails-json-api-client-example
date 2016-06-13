class BaseResource < JsonApiClient::Resource

  # root url to your API server, you may set it in development.rb or environment variable
  self.site = 'http://localhost:3000/api/v1'

end
