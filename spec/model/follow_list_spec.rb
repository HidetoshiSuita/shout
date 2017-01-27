require "rails_helper"

describe FollowList, type: :model do
  describe 'get_follow_info_list' do
    it '誰もフォローをしていなかった場合' do
      my_id = 1
      expect(FollowList.get_follow_info_list(my_id)).to eq [1]
    end
    it 'ID:2をフォローしていた場合' do
      my_id = 1
      follow_user = FollowList.new
      follow_user.update(:user_id => 1, :follow_id => 2)
      expect(FollowList.get_follow_info_list(my_id)).to eq [2,1]
    end
    it 'Id:2,Id：3をフォローしていた場合' do
      my_id = 1
      follow_user = FollowList.new
      follow_user2 = FollowList.new
      follow_user.update(:user_id => 1, :follow_id => 2)
      follow_user2.update(:user_id => 1, :follow_id => 3)
      expect(FollowList.get_follow_info_list(my_id)).to eq [2,3,1]
    end 
  end
end
