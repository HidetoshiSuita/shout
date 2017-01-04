module AfterLogInProsessHelper
  def get_resp(id)#返信のshout_id
    info=ShoutList.find_by(:id => id)
    info
  end
end
