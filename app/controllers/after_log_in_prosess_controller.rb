class AfterLogInProsessController < ApplicationController
  before_action :login_check
 
 def menu
   #新着順
   #@genre=>ジャンル　@article=>話題提供
   @genre_id = 1
   if !params[:genre_id].nil?
       @genre_id = params[:genre_id]
       @article = Article.where("genre_id = #{@genre_id}").order(created_at: :desc)
   else
       @article = Article.all.order(created_at: :desc)
   end
   @genre = Genre.all
   @article_info = Article.new
   @shout = ShoutList.new
   @shout_list = ShoutList.where(resp_shout: nil).order(created_at: :asc)
   @resp_shout = ShoutList.where.not(resp_shout: nil).order(created_at: :asc)
 end
 
 def favorite
   #人気順
   # Shoutlistからarticle_idの最大値を取得
   cntmax = Shoutlist.maximum('id')
   max_array = []
   tmp = []
   
   # 順番にデータの取得をしていく。
   [1..cntmax].each do |article_id|
      tmp.clear
      max_array = ShoutList.where("article_id = #{article_id}").count()
      tmp << article_id
      tmp << max_array
   end
   max_array = tmp.sort_by{|max|
     tmp = max[][1]
   }
   puts max_array
   
 end
 
 def my_genre
   #ジャンル別
   #@genre=>ジャンル　@article=>話題提供
   @user_info = User.find_by(:id => current_user.id)
   @genre = UserGenre.select(:genre_id).where("user_id=#{current_user.id}")
   
   if !params[:genre_id].nil?
       @genre_id = params[:genre_id]
       @article = Article.where("genre_id = #{@genre_id}").order(created_at: :desc)
   else
       @article = Article.where(genre_id:@genre).order(created_at: :desc)
   end
   
   @article_info = Article.new
   @shout = ShoutList.new
   @shout_list = ShoutList.where(resp_shout: nil).order(created_at: :asc)
   @resp_shout = ShoutList.where.not(resp_shout: nil).order(created_at: :asc)
 end

  def update_my_genre_info
    UserGenre.delete_all(user_id: current_user.id)
    unless params[:genre].nil?
      params[:genre][:genre_id].each do |g|
        @usergenre = UserGenre.new(user_id: current_user.id, genre_id: g)
        @usergenre.save
      end
    end
    redirect_to :action => "my_genre"
  end

 def new_article_action
   @article_info = Article.new(new_create_article)
   
   if !params[:article][:img].nil?
      @article_info.img = params[:article][:img].read
      @article_info.img_content = params[:article][:img].content_type
   end
   
   respond_to do |format|
     if @article_info.save
       format.html { redirect_to after_log_in_prosess_menu_path, notice: 'Article was successfully created.' }
       format.json { render :menu, status: :created, location: @article_info }
     else
       format.html { render :menu }
       format.json { render json: @article_info.errors, status: :unprocessable_entity }
     end
   end
 end
 
 # edit_article_action 変更画面への遷移　update_article_action　変更画面での決定押下時の動作
 def edit_article_action
   @article = Article.find_by(:id => params[:id] ) 
   @result = Article.new
 end
 def update_article_action
   article = Article.new(new_create_article)
   info = Article.find_by(:id => article[:id] )
   
   if !params[:article][:img].nil?
      article.img = params[:article][:img].read
      article.img_content = params[:article][:img].content_type
   end
   
   if info.update(
     :title => article[:title], :tag => article[:tag], :comment => article[:comment], :img => article[:img], :genre_id => article[:genre_id] , :img =>article[:img], :img_content =>article[:img_content]
      )
     flash[:update_article_result] = '更新しました'
   else
     flash[:update_article_result] = '更新できませんでした。もう一度お願いします。'
   end
   redirect_to :action => "menu"
 end
 
 def article_detail
   @article = Article.find_by(:id => params[:id] )
   @shout_list = ShoutList.where(article_id: params[:id]).where(resp_shout: nil).order(created_at: :asc)
   @resp_shout = ShoutList.where(article_id: params[:id]).where.not(resp_shout: nil).order(created_at: :asc)
 end
 
 # remake_shout 変更画面への遷移　update_shout　変更画面での決定押下時の動作
 def remake_shout
    @shout=ShoutList.find_by(:id => params[:id])
    @result = ShoutList.new
 end
 def update_shout
   shout=ShoutList.new(update_shout_params)
   info=ShoutList.find_by(:id =>shout[:id] )
   
   if info.update(:shout => shout[:shout], :emotion_no => shout[:emotion_no])
     flash[:update_shut_result] = '更新しました'
   else
     flash[:update_shut_result] = '更新できませんでした。もう一度お願いします。'
   end
   redirect_to :action => "menu"
 end
 
 def shout
   @shout = ShoutList.new(update_shout_params)
   
   respond_to do |format|
     if @shout.save
       format.html { redirect_to after_log_in_prosess_menu_path, notice: 'Shout was successfully created.' }
       format.json { render :menu, status: :created, location: @shout }
     else
       format.html { render :menu }
       format.json { render json: @shout.errors, status: :unprocessable_entity }
     end
   end
 end

 def watch_shout
   follow_list = FollowList.get_follow_info_list(current_user.id)
   @shout = ShoutList.where(:user_id => follow_list).order(created_at: :asc)
 end

 #返信画面への遷移　resp_shout　返信の登録　register_resp
 def resp_shout
   #　【返信元】　@un_resp
   # 該当する1件のshoutを取得
   #　【返信先】 @resp_info
   # オブジェクトを生成しておく
   @un_resp = ShoutList.get_unresp_shout(params[:id].to_i)
   @resp_info = ShoutList.new
 end
 def register_resp
    #:shout 返信内容
    #:user_id 返信者のuser_id
    #:resp_shout 返信対象となるshout id
    #:article_id 関連する記事 id
    #:emotion_no 設定された感情
    resp_shout = ShoutList.new(
      :shout => resp[:shout], :user_id => resp[:user_id], :resp_shout => resp[:id], :shout_verify => resp[:shout_verify], :article_id => resp[:article_id], :emotion_no => resp[:emotion_no]
                            )
    #返信先のユーザー
    resp_user_shout = ShoutList.find_by(:id => resp_shout[:resp_shout])

    if resp_shout.save
      PostMailer.resp_email(
      User.find_by(:id =>current_user.id), User.find_by(:id => resp_user_shout[:user_id])).deliver
    end
    
    redirect_to :action => "menu"
 end
 
 def icon
    emotion_no = params[:id]
    img = File.open("public/img/icon/#{emotion_no}.png", "r+b")
    bin = img.read
    img.close
    send_data( bin, type: "image/png", disposition: :inline)
  end
  
  def show_article_img
    article_img = Article.find(params[:id])
    if !article_img.img.nil?
      send_data(article_img.img, :type => article_img.img_content, :disposition => 'inline')
    end
  end 
  def show_img
    @user = User.find(params[:id])
    if !@user.img.nil?
      send_data(@user.img, :type => @user.img_content, :disposition => 'inline')
    end
  end
 #---------------------------------------------------------------
 
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
    
    if !params[:user][:img].nil?
      user.img = params[:user][:img].read
      user.img_content = params[:user][:img].content_type
    end
    
    if user.update(name:info[:name], introduction:info[:introduction], img:user.img, img_content:user.img_content )
      
      #中間テーブルの情報書き換え
      unless params[:genre].nil?
        UserGenre.delete_all(user_id: info[:id])
        params[:genre][:genre_id].each do |g|
          @usergenre = UserGenre.new(user_id: info[:id], genre_id: g)
          @usergenre.save
        end
      end

      flash[:update_my_info] = '変更しました。反映まで時間がかかる場合があります'
    else
      flash[:update_my_info] ='反映できませんでいした。もう一度お願いします。'
    end
    
    redirect_to :action => "watch_my_info", :id => info[:id]
  end

  def destoroy_shout
    shout=ShoutList.find_by(:id => params[:id])
    
    #　元のshoutを消した場合、返信したshoutが残っていたので発生
    if shout.resp_shout.nil?
      delete_shout = ShoutList.where(:shout_verify => shout.shout_verify )
      delete_shout.destroy_all
    end
    
    if shout.destroy
      flash[:destroy_shout_result] = '削除しました。'
    else
      flash[:destroy_shout_result] = '削除できませんでした。もう一度お願いします。'
    end
    redirect_to :action => "menu"
  end
  private

  def resp
    params.require(:shout_list).permit(:shout, :user_id, :id, :emotion_no, :article_id, :shout_verify )
  end

  def user_id
    params.require(:id).permit(:user_id, :id, :follow_id)
  end

  def update_my_info_params
    params.require(:user).permit(:id, :name, :introduction)
  end

  def update_shout_params
    params.require(:shout_list).permit(:shout, :id, :emotion_no, :article_id, :user_id, :shout_verify)
  end
  
  def new_create_article
    params.require(:article).permit(:id, :title, :tag, :comment, :img, :genre_id, :user_id)
  end
  
end
