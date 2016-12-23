class AfterLogInProsessController < ApplicationController
   before_action :login_check, only: :shout

  def chouse
  end

  def shout
    @user = ShoutList.new
  end

  def shout_aftre
  end

  def watch_shout
      @shout = Shout_list.where(:user_id => current_user.id)
  
  end
end
