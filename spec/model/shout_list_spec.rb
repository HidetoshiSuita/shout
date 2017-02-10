require "rails_helper"

describe ShoutList, type: :model do
  describe 'create_shout_list' do
    xit '成功した場合' do
      contents = 'テスト'
      user_id = 1
      expect(create_shout_list(contents,user_id)).to eq true
    end
  end
  describe 'get_unresp_shout' do
    it '返信対象が存在していた場合' do
      shout_id = 1
      shout = ShoutList.new(:id => 1)
      shout.save
      expect(ShoutList.get_unresp_shout(shout_id)).to eq shout
    end
    it '返信対象が削除されていた場合' do
      shout_id = 1
      expect(ShoutList.get_unresp_shout(shout_id)).to eq 'そのshoutは削除されています'
    end
  end
end
