class FlightsController < ApplicationController
  def home
    @airports = Airport.get_airports
  end

  def index
    origin = params[:origin]
    destination = params[:destination]
    passengers = params[:passengers]
    date = params[:date]
    @flights = Flight.path(params[:origin], params[:destination])
    respond_to do |format|
      format.js {}
    end
  end
end
