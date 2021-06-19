class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :description, :created_at, :lat, :lng, :prefectures
  belongs_to :user
  has_many :reviews
end
