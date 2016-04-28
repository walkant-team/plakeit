class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  after_action :store_url

  helper_method :current_user, :logged_in?

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  protected

  def previous_url
    session[:previous_url] || root_path
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless Rails.env.test?
  end

  def store_url
    return unless request.get?
    session[:previous_url] = request.fullpath
  end
end
