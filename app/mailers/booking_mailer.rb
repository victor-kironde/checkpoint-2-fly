class BookingMailer < ApplicationMailer
  default from: 'bookings@rails-fly.herokuapp.com/'

  def booking_confirmation(booking)
    @booking = booking
    mail(to: @booking.email, subject: 'Rails-Fly Bookings')
  end
end
