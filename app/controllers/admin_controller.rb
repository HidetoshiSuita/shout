class AdminController < ApplicationController
  before_action :login_check
  # Basic認証フィルタを対象アクションに指定
  http_basic_authenticate_with :name => 'admin', :password => 'pass', :only => :admin_menu

  def admin_menu
  end
  def admin_user
    @user = User.all
  end
  def admin_update_user
    user = User.find_by(:id =>params[:id])
    
    if !user.user_available.nil?
      if user.user_available == true
        user.update(:user_available  => false )
      else
        user.update(:user_available => true )
      end
    end
    
    redirect_to :action => "admin_user"
  end
end
