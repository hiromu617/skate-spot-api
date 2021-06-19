class User < ApplicationRecord
  has_many :spots
  has_many :reviews
end
