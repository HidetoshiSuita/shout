class ShoutList < ApplicationRecord
  def create_shout_list(contents, usr_id)
    ShoutList.create(
                     :shout => contents,
                     :user_id =>usr_id
                     )
  end

  def get_shout_to_watch(user_id)#,user_follow_info)#フォローユーザーのidからレコードを取得するメソッドを作りたい
    #@shout_list=#ここに入れてviewに渡す
    @shout = Shout_list.where(:user_id => user_id)
    p "000000000000000000"
    pp @shout
    #
  end
end
