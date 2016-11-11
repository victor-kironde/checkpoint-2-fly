class BookingsController < ApplicationController
  before_action :find_booking_by_id, only: [:show, :edit, :update, :destroy]

  def new
    flight = Flight.find_by id: params[:flight]
    if flight
      @booking = flight.bookings.new
      params[:passengers].to_i.times { @booking.passengers.build }
    else
      flash[:danger] = "No flight was selected."
      redirect_to root_path
    end
  end

  def create
    flight = Flight.find_by id: booking_params[:flight_id]
    @booking = flight.bookings.new(booking_params)
    if @booking.save
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to @booking
       flash[:success] = "Your booking was successfully created."
    else
      params[:passengers] = booking_params[:passengers_attributes].length
      params[:departure] = booking_params[:departure]
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      BookingMailer.booking_confirmation(@booking).deliver_now
      flash[:success] = "Your booking was successfully updated."
      redirect_to @booking
    else
      params[:passengers] = booking_params[:passengers_attributes].length
      params[:departure] = booking_params[:departure]
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    flash[:success] = "Your booking was successfully deleted!"
    redirect_to bookings_user_path(current_user)
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

  def find_booking_by_id
    @booking = Booking.find(params[:id])
  end

  def can_edit(booking)
    current_user && current_user.email == booking.email
  end

  def booking_params
    params.require(:booking)
          .permit(:email, :departure, :flight_id, :user_id,
          passengers_attributes: [:id, :name, :passport_number, :phone, :_destroy])
  end
end
