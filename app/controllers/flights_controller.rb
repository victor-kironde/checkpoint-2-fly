class FlightsController < ApplicationController
  def home
    @airports = Airport.get_airports
  end

  def index
    origin = params[:origin]
    destination = params[:destination]
    passengers = params[:passengers]
    date = params[:date]
    @search = FlightSearch.new(origin, destination, passengers, date)
    respond_to do |format|
      format.js {}
    end
  end
end
