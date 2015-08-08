class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender

  respond_to :json

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)
  end
end
