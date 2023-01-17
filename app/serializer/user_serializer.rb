class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :email, :user_api_key
end