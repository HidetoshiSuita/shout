class PostMailer < ApplicationMailer
  def resp_email(user, resp_user, resp_shout, article )
    
    @resp_user = user # 返信した人
    @user = resp_user # 返信された人
    @resp = resp_shout # 返信内容
    @article = article # 記事
    
    mail to: resp_user.email, subject: "返信がありました"
  end
end
