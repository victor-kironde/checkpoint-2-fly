class BookingsController < ApplicationController
  def new
    flight = Flight.find_by id: params[:flight]
    if flight
      @booking = flight.bookings.new
      params[:passengers].to_i.times { @booking.passengers.build }
    else
      redirect_to root_path, alert: "No flight was selected."
    end
  end

  def create
    flight = Flight.find_by id: booking_params[:flight_id]
    @booking = flight.bookings.new(booking_params)
    if @booking.save
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to @booking, alert: "Booking successfully created."
    else
      params[:passengers] = booking_params[:passengers_attributes].length
      params[:departure] = booking_params[:departure]
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to @booking, alert: "Booking updated successfully."
    else
      params[:passengers] = booking_params[:passengers_attributes].length
      params[:departure] = booking_params[:departure]
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_user_path(current_user), alert: "Booking deleted!"
  end

  def manage
    @booking = Booking.find_by reference: params[:ref].strip
    if @booking
      if can_edit(@booking)
        redirect_to edit_booking_path(@booking), alert: "Booking found."
      else
        redirect_to @booking, alert: "Booking found."
      end
    else
      redirect_to find_bookings_path
      flash[:danger] = "Booking does not exist."
    end
  end

  private

  def can_edit(booking)
    current_user && current_user.email == booking.email
  end

  def booking_params
    params.require(:booking)
          .permit(:email, :departure, :flight_id, :user_id,
          passengers_attributes: [:id, :name, :passport_number, :phone, :_destroy])
  end
end
