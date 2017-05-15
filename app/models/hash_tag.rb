class HashTag < ApplicationRecord
  belongs_to :article
  has_many :users, through: :user_hash_tags
end
