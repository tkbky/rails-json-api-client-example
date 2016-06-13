class TokenAuthMiddleware < Faraday::Middleware

  attr_reader :klass, :app

  def initialize(app, klass)
    super(app)
    @klass = klass
  end

  def call(environment)
    environment[:request_headers]['Authorization'] = "Token token=#{@klass.auth_token}, email=#{@klass.email}"
    @app.call(environment)
  end

end
