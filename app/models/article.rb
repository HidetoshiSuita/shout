class Article < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :articles
end
