class SessionsController < ApplicationController
  def create
    authentication = Authentication.find_or_create_from_auth_hash(auth_hash)
    self.current_user = authentication.user
    redirect_to root_path, notice: 'Logeado :)'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
