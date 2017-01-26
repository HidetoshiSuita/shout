class FollowList < ApplicationRecord
  belongs_to :users

  def self.get_follow_info_list(my_id)
    follow_list = []
    follow_recod = FollowList.where(:user_id => my_id)
    follow_recod.each do |info|
      follow_list.push(info[:follow_id])
    end
    follow_list.push(my_id)
  end
end
