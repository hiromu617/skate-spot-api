class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :limit
  has_many :spots
end
