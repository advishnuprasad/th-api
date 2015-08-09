class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::Serialization
  serialization_scope :view_context

  respond_to :json
  before_action :authenticate_user!
end
