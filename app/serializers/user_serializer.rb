class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :auth_token, :next_level

  def auth_token
    if scope.params[:controller] == "devise/sessions" && scope.params[:action] == "create"
      object.authentication_token
    end
  end

  def next_level
    QuestionSerializer.new(object.next_level) if object.next_level
  end
end
