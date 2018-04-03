class MakobangMailer < ApplicationMailer

  def received_email(inquiry)
    @inquiry_for_mail = inquiry
    mail(to:@inquiry_for_mail.email, subject:'お問合せを承りました')
  end

end
