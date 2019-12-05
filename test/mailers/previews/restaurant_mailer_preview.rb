# Preview all emails at http://localhost:3000/rails/mailers/restaurant_mailer
class RestaurantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/restaurant_mailer/reservation_confirmation
  def reservation_confirmation
    RestaurantMailer.reservation_confirmation
  end

end
