class Article < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :shouts
  
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  
end
