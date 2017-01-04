class AfterLogInProsessController < ApplicationController
  before_action :login_check, only: :shout

 def choused
 end

 def shout
   @user = ShoutList.new
 end

 def shout_aftre
 end

 def watch_shout
      @shout = ShoutList.where(:user_id => current_user.id).reverse
 end

  def find_user
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
  end

 def find_user_result
 end

 def resp_shout
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp_info = ShoutList.new
 end

 def register_resp
    resp=ShoutList.new(resp_info_params)
    #:shout=返信内容、:user_id=返信者のuser_id, :id=返信対象となるshoutのid
    id=ShoutList.make_resp(resp)
    ShoutList.update_resp(resp,id)
    redirect_to :action => "watch_shout"
 end

private

def resp_info_params
  params.require(:shout_list).permit(:shout, :user_id, :id)
end
end
