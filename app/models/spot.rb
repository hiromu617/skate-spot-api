class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews
end
