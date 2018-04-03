require 'test_helper'

class MakobangMailerTest < ActionMailer::TestCase
  test "send_when_inquiry" do
    mail = MakobangMailer.send_when_inquiry
    assert_equal "Send when inquiry", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
