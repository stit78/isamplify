require 'test_helper'

class ExporterMailerTest < ActionMailer::TestCase
  test "reception_confirmation" do
    mail = ExporterMailer.reception_confirmation
    assert_equal "Reception confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
