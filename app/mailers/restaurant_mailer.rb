class RestaurantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.restaurant_mailer.reservation_confirmation.subject
  #
  def guest_reservation_confirmation(reservation)
  	@reservation = reservation
    mail to: "#{reservation.guest_email}", subject: "Reservation details"
  end

  def guest_modified_reservation_confirmation(reservation,changes)
  	@reservation = reservation
  	@changes = changes
    mail to: "#{reservation.guest_email}", subject: "Modified Reservation details"
  end

  def restaurant_reservation_confirmation(reservation)
  	@reservation = reservation
    mail to: "#{reservation.restaurant.email}", subject: "Guest details"
  end

end