require "rails_helper"

describe AfterLogInProsessHelper, type: :helper do
  describe 'get_resp' do
    it '叫びが存在している時' do
      id = 1
      shout = ShoutList.new(:id => 1)
      shout.save
      expect(get_resp(id)).to eq shout
    end
    it '叫びが存在しない時' do
      id = 1
      expect(get_resp(id)).to eq nil
    end
  end
end
