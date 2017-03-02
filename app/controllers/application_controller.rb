class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログインしていなかった時にログイン画面へ飛ばす処理
  def login_check
    if user_signed_in? == false
       redirect_to '/users/sign_in'
    end
  end
  
  # 以下を追加
  before_filter :auth
  private
  def auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'admin' && pass == 'shoutTest9876'
    end
  end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
 end
end
