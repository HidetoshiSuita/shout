class AfterLogInProsessController < ApplicationController
   before_action :login_check, only: :shout

  def chouse
  end

  def shout
    @user = ShoutList.new
  end

  def shout_aftre
  end
end
