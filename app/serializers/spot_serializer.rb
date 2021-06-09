class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :lat, :lng, :prefectures
  belongs_to :user
end
