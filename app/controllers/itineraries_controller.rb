class ItinerariesController < ApplicationController
  def new  
  end

  def create 
    if params["commit"] == "Search"
      @yelp = YelpApi.new
      @activities = []
      search = params["search"]["ids"]
      search.each do |k, v|
        @yelp.set_params(v["term"],v["tag"])
        @yelp.search
        @activities << @yelp.results.shuffle.pop
      end
      render 'show'
    else 
      @itinerary = Itinerary.new
      @itinerary.add_activities(@activities)
    end
  end
  
end
