class ShoutList < ApplicationRecord
 has_many :like_lists, dependent: :destroy
 belongs_to :article
 
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
 
  def create_shout_list(contents, usr_id)
    ShoutList.create(
                     :shout => contents,
                     :user_id =>usr_id
                     )
  end

  def  self.get_unresp_shout(shout_id)
    #idに紐づく１件を取得して返す。　正=>オブジェクト　誤り=>そのshoutは削除されています
    un_shout = ShoutList.find_by(:id => shout_id )
    if un_shout == nil
      un_shout = 'そのshoutは削除されています'
    end
    un_shout
  end
end
