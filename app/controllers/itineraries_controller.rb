class ItinerariesController < ApplicationController
  def create
    @yelp = YelpApi.new
    @activities = []
    search = params["search"]["ids"]
    search.each do |k, v|
      @yelp.set_params(v["term"],v["tag"])
      @yelp.search
      @activities << @yelp.results.shuffle.pop
    end

    # This should only happen if User clicks save
    # @itinerary = Itinerary.create
    # @itinerary.add_activities(@activities)

    render 'show'
  end
end
