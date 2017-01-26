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
   follow_list = FollowList.get_follow_info_list(current_user.id)
  @shout=ShoutList.where(:user_id => follow_list).order(created_at: :desc)
 end

  def find_user
    @q = User.search
  end

 def find_user_result
   @q = User.search(params[:q])
   @users = @q.result(distinct: true)
 end

 def find_user_detail
   @user_info = User.find_by(:id => params[:id])
   @user_shout = ShoutList.where(:user_id =>params[:id])
   follow_info_check = User.find_by(:id => current_user.id)
   @follow_info_result = follow_info_check.follow_lists.find_by(
     :user_id => current_user.id , :follow_id => params[:id].to_i
   )
   @folow=FollowList.where(:user_id => @user_info[:id])
   @follower = FollowList.where(:follow_id => @user_info[:id])
 end


 def resp_shout
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp_info = ShoutList.new
 end

 def register_resp
    #:shout=返信内容、:user_id=返信者のuser_id, :id=返信対象となるshoutのid
    resp_shout=ShoutList.new(
      :shout => resp[:shout], :user_id => resp[:user_id],:resp_shout => resp[:id]
                            )
    resp_user_shout=ShoutList.find_by(:id => resp_shout[:resp_shout])

    if resp_shout.save
      PostMailer.resp_email(
        User.find_by(:id =>current_user.id),User.find_by(:id => resp_user_shout[:user_id])).deliver
    end

    redirect_to :action => "watch_shout"
 end

 def watch_resp_shout
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp = ShoutList.where(:resp_shout => params[:id].to_i)
 end

 def follow_user
   user = User.find_by(:id => params[:user_id].to_i)
  if user.follow_lists.create(:user_id => params[:user_id].to_i, :follow_id => params[:follow_id].to_i)
    flash[:follow_user_result] = 'フォローしました。'
  else
    flash[:follow_user_result] = 'フォローできませんでした。もう一度お願いします。'
  end
   redirect_to :back
 end

 def delete_follow_list
   follow_list = FollowList.find_by(:id => params[:id])
   follow_list.destroy
   redirect_to :back
 end

 def make_like
   shout = ShoutList.find_by(:id => params[:shout_id].to_i)
   if shout.like_lists.create(:shout_list_id => shout[:id], :user_id => params[:user_id].to_i)
     flash[:make_like_result] = 'イイネしました。'
   else
     flash[:make_like_result] = 'イイネできませんでした'
   end
   redirect_to :back
 end

 def destroy_like_list
   like_list=LikeList.find_by(:user_id => params[:user_id].to_s, :shout_list_id => params[:shout_id].to_s )
   like_list.destroy
   redirect_to :back
 end

  def watch_my_info
    @user = User.find_by(:id => params[:id])
    @shout = ShoutList.where(:user_id => params[:id])
    @follow = FollowList.where(:user_id => params[:id])
    @follower = FollowList.where(:follow_id => params[:id])
  end

  def watch_follow_user
    @follow_user_id = FollowList.where(:user_id => params[:id])
  end

  def watch_follower
    @follower_id = FollowList.where(:user_id => params[:id])
  end

  def update_my_info
    @info = User.new
    @user_info = User.find_by(:id => params[:id])
  end

  def action_update_my_info
    info=User.new(update_my_info_params)
    user = User.find_by(:id =>info[:id])
    if user.update(name:info[:name],introduction:info[:introduction])
      flash[:update_my_info] = '変更しました。反映まで時間がかかる場合があります'
    else
      flash[:update_my_info] ='反映できませんでいした。もう一度お願いします。'
    end
    redirect_to :action => "watch_my_info", :id => info[:id]
  end

  def remake_shout
    @shout=ShoutList.find_by(:id => params[:id])
    @result = ShoutList.new
  end

  def update_shout
   shout=ShoutList.new(update_shout_params)
   info=ShoutList.find_by(:id =>shout[:id] )
   if info.update(:shout => shout[:shout])
     flash[:update_shut_result] = '更新しました'
   else
     flash[:update_shut_result] = '更新できませんでした。もう一度お願いします。'
   end
   redirect_to :action => "watch_shout"
  end

  def destoroy_shout
    shout=ShoutList.find_by(:id => params[:id])
    if shout.destroy
      flash[:destroy_shout_result] = '削除しました。'
    else
      flash[:destroy_shout_result] = '削除できませんでした。もう一度お願いします。'
    end
    redirect_to :action => "watch_shout"
  end
  private

  def resp
    params.require(:shout_list).permit(:shout, :user_id, :id)
  end

  def user_id
    params.require(:id).permit(:user_id, :id, :follow_id)
  end

  def update_my_info_params
    params.require(:user).permit(:id, :shout)
  end

  def update_shout_params
    params.require(:shout_list).permit(:shout, :id)
  end
end
