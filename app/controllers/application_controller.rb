class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless Rails.env.test?
  end
end
