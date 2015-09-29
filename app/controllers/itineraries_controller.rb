class ItinerariesController < ApplicationController
  def show
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    byebug
    Activity.new(params["tags"]["aliases"])
  end
end
