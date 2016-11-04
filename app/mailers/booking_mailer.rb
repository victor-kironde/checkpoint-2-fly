class BookingMailer < ApplicationMailer
  default from: "bookings@flynrails.herokuapp.com"

  def booking_confirmation(booking)
    @booking = booking
    mail(to: @booking.email, subject: 'Flyn')
  end
end
