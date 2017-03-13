class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :firstname, :surname, :created_at
end
