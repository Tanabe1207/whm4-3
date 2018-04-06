class MakobangMailer < ApplicationMailer

  def received_email(inquiry)
    @inquiry_for_mail = inquiry
    mail(to:@inquiry_for_mail.email, subject:'お問合せを承りました')
  end

  def send_when_registered(user)
    @user = user
    mail(subject:"会員登録が完了しました！", to:@user.mail)
      # do |format|
      # format.text
      # end
  end

end
