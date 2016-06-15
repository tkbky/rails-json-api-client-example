class SessionsController < ApplicationController

  skip_around_action :authenticate_user!, only: [:new, :create]

  def new
    @session = Session.new(default_params)
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      store_credentials
      redirect_to posts_path
    else
      flash.now[:error] = 'Login failed!'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def default_params
    { email: '', password: '' }
  end

  def store_credentials
    session[:auth_token] = @session['auth-token']
    session[:email] = @session['email']
  end

end
