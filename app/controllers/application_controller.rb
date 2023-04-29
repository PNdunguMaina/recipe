class ApplicationController < ActionController::Base
  # protect against Cross-Site Request Forgery (CSRF) attacks
  protect_from_forgery with: :exception

  # modify the permitted parameters that can be used in the Devise gem
  before_action :update_allowed_parameters, if: :devise_controller?

  # ensure that a user is authenticated before accessing a particular controller action
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    foods_path
  end

  def after_sign_out_path_for(resource_or_scope)
    public_recipes_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
