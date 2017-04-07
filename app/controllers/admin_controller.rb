class AdminController < ApplicationController
  before_action :login_check
  before_filter :auth
  

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
  
  def auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_ID'] && pass == ENV['BASIC_PASSWORD']
    end
  end
end
