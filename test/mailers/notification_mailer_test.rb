require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "transaction_success" do
    mail = NotificationMailer.transaction_success
    assert_equal "Transaction success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "error" do
    mail = NotificationMailer.error
    assert_equal "Error", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
