class BaseResource < JsonApiClient::Resource

  # root url to your API server, you may set it in development.rb or environment variable
  self.site = ENV['ROOT_ENDPOINT']

  class << self

    attr_writer :email, :auth_token

    def email
      @email ||= begin
        superclass.email if superclass.respond_to?(:email)
      end
    end

    def auth_token
      @auth_token ||= begin
        superclass.auth_token if superclass.respond_to?(:auth_token)
      end
    end

    def connection
      super.tap do |conn|
        conn.use TokenAuthMiddleware, self
      end
    end

    def authenticate_with(email, auth_token)
      self.email = email
      self.auth_token = auth_token
      yield
    ensure
      self.email = nil
      self.auth_token = nil
    end

  end

end
