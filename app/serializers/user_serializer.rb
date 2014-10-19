class UserSerializer < ActiveModel::Serializer
  attributes :email, :remember_me_token
end
