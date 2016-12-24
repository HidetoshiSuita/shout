module ApplicationHelper
  def find_user_name(user_id)#IDから名前を取得するだけのメソッド

    user_info_hash = {}
    user_name=''

    user_info_hash = User.find_by(:id => user_id)
    user_name = user_info_hash[:name]

  end
end
