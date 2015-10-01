class ItinerariesController < ApplicationController
  def create
    if params["search"]
      yelp = YelpApi.new
      @activities = []
      @search = params["search"]["ids"]
      yelp.set_location(params[:latitude],params[:longitude])
      @search.each do |k,v|
        yelp.set_params(v["term"], v["tag"], params["sort"])
        yelp.search
        @activities << yelp.results
      end
    elsif params["commit"] == 'Save Itinerary'
      @itinerary = Itinerary.create
      @itinerary.add_activities(params["activity_ids"])
      render 'show'
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
  end
end
