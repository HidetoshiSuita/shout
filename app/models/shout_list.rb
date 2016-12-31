class ShoutList < ApplicationRecord
  def create_shout_list(contents, usr_id)
    ShoutList.create(
                     :shout => contents,
                     :user_id =>usr_id
                     )
  end

  def  self.get_unresp_shout(shout_id)
    un_shout = {}
    un_shout = ShoutList.find_by(:id => shout_id )
    if un_shout == {}
      un_shout="そのshoutは削除されています"
    end
    un_shout
  end

  # def get_shout_to_watch(user_id)#,user_follow_info)#フォローユーザーのidからレコードを取得するメソッドを作りたい
  #   #@shout_list=#ここに入れてviewに渡す
  #   @shout = Shout_list.where(:user_id => user_id)
  # end
end
