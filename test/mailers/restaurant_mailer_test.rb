require 'test_helper'

class RestaurantMailerTest < ActionMailer::TestCase
  test "reservation_confirmation" do
    mail = RestaurantMailer.reservation_confirmation
    assert_equal "Reservation confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
