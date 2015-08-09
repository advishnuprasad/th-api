class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :auth_token

  def auth_token
    if scope.params[:controller] == "devise/sessions" && scope.params[:action] == "create"
      object.authentication_token
    end
  end

end
