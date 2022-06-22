class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  # load_and_authorize_resource

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:name, :email, :password, :phone]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  def current_cart
    Cart.find_by(user_id: current_user.id)
  end

  helper_method :current_cart
end
