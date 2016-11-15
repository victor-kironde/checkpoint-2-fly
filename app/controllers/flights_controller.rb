class FlightsController < ApplicationController
  def home
    @airports = Airport.get_airports
  end

  def index
    @flights = Flight.path(params[:origin], params[:destination])
    respond_to do |format|
      format.js {}
    end
  end
end
