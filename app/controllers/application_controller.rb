class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  around_action :authenticate_user!

  rescue_from JsonApiClient::Errors::NotAuthorized, with: :not_authorized!

  private

  def authenticate_user!
    BaseResource.authenticate_with(session[:email], session[:auth_token]) do
      yield
    end
  end

  def not_authorized!
    redirect_to new_session_path, flash: { error: 'Access denied!' }
  end

end
