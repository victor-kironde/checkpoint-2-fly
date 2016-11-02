class FlightController < ApplicationController

  attr_reader :errors, :flights, :passengers, :date

  def index
    @flight = Flight.new
    @airports = Airport.airports_all
  end
  def search_flights
    @flights = Flight.search_flights(flight_params)
    flash[:notice] = nil
    if @flights.empty?
      flash[:notice] = "There are no available flights."
      respond_to do |format|
        format.js {render layout: false}
      end
    else
      respond_to do |format|
        format.js {render layout: false}
      end
    end
  end
end
