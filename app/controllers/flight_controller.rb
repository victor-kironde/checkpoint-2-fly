class FlightController < ApplicationController

  def index
    @flight = Flight.new
    @airports = Airport.airports_all
  end

  def search_flight

  end
end
