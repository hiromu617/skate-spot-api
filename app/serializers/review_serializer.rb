class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :created_at
  belongs_to :user
  belongs_to :review
end
