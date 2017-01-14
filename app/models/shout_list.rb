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
    if un_shout == {}
      un_shout="そのshoutは削除されています"
    end
    un_shout
  end

  def self.make_resp(resp_info)
      resp=ShoutList.create(:shout => resp_info[:shout], :user_id => resp_info[:user_id])
      resp[:id]
  end
  def self.update_resp(resp_info,resp_shout_id)
    update_info=ShoutList.find_by(:id => resp_info[:id])
    update_info.resp_shout=resp_shout_id
  end

  def self.get_follow_shout(user_id)
    follow_info = FollowList.where(:user_id => user_id)
    follow_shout = []
    follow_info.each do |info|
      follow_shout << ShoutList.where(:user_id => info[:follow_id])
    end
    follow_shout
  end
end
