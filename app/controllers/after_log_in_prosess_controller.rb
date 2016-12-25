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
      my_shout = ShoutList.where(:user_id => current_user.id)
      @shout = my_shout.sort_by{|shout_info| shout_info[:cretate_at]}.reverse!
  end

  def find_user

  end
end
