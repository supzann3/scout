class ItinerariesController < ApplicationController

  def create
    if params["commit"] == "Search"
      @yelp = YelpApi.new
      @activities = []
      search = params["search"]["ids"]
      @yelp.set_location(params[:latitude],params[:longitude])
      sort = params["sort"]
      search.each do |k, v|
        @yelp.set_params(v["term"], v["tag"], sort)
        @yelp.search
        @activities << @yelp.results[k.to_i]
      end
      render 'show'
    else 
      @itinerary = Itinerary.new
      @itinerary.add_activities(@activities)
    end
  end
  
end
