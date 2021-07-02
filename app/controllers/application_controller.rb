class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: %i[buyer broker admin]
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username type approved])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def default_url_options
    if Rails.env.production?
      Rails.application.routes.default_url_options = { host: 'www.stock-app-stonks.herokuapp.com', protocol: 'https' }
    elsif Rails.env.development?
      Rails.application.routes.default_url_options = { host: 'localhost:3000', protocol: 'http' }
    end
  end
end
