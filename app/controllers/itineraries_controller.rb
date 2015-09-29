class ItinerariesController < ApplicationController
  def create
    @itinerary = Itinerary.new
    tags = params["tags"]["ids"]
  end
end
