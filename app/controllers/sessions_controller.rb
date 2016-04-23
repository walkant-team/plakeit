class SessionsController < ApplicationController
  def create
    authentication = Authentication.find_or_create_from_auth_hash(auth_hash)
    self.current_user = authentication.user
    redirect_to previous_url, notice: 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to previous_url, notice: 'Signed out!'
  end

  def failure
    redirect_to previous_url, notice: 'Hubo un error al intentar logearse'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
