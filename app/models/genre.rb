class Genre < ApplicationRecord
  has_many :users
  has_many :user_genres
end