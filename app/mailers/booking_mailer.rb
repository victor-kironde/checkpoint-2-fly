class BookingMailer < ApplicationMailer
  default from: "rails.fly@gmail.com"

  def booking_confirmation(booking)
    @booking = booking
    mail(to: @booking.email, subject: "Rails-Fly Bookings")
  end
end
