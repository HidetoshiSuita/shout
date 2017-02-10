class ShoutList < ApplicationRecord
 has_many :like_lists, dependent: :destroy
  def create_shout_list(contents, usr_id)
    ShoutList.create(
                     :shout => contents,
                     :user_id =>usr_id
                     )
  end

  def  self.get_unresp_shout(shout_id)
    un_shout = ShoutList.find_by(:id => shout_id )
    if un_shout == nil
      un_shout = 'そのshoutは削除されています'
    end
    un_shout
  end
end
