class PostMailer < ApplicationMailer
  def resp_email(user_info, resp_user_info)
    @user_name = user_info.name
    mail to: resp_user_info.email, subject: "返信がありました"
  end
end
