class ShoutList < ApplicationRecord
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
#     if update_info.save
#        flash[:resp_result] = "返信を実行しました。"
#     else
#       flash[:resp_result] = "返信が実行されませんでした。もう一度お願いします。"
#     end
# 　　flash[:resp_result]
  end
  # def get_shout_to_watch(user_id)#,user_follow_info)#フォローユーザーのidからレコードを取得するメソッドを作りたい
  #   #@shout_list=#ここに入れてviewに渡す
  #   @shout = Shout_list.where(:user_id => user_id)
end
