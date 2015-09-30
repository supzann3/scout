class ItinerariesController < ApplicationController
  def create
    @yelp = YelpApi.new
    @activities = []
    tags = params["tags"]["ids"]
    tags.each do |tag|
      @yelp.set_params(tag)
      @activities << @yelp.search
    end

    # This should only happen if User clicks save
    # @itinerary = Itinerary.create
    # @itinerary.add_activities(@activities)

    render 'show'
  end
end
