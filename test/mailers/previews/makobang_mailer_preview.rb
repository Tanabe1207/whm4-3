# Preview all emails at http://localhost:3000/rails/mailers/makobang_mailer
class MakobangMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/makobang_mailer/send_when_inquiry
  def send_when_inquiry
    MakobangMailer.send_when_inquiry
  end

end
