class ItinerariesController < ApplicationController
  def create
    if params["search"]
      yelp = YelpApi.new
      @activities = []
      @search = params["search"]["ids"]
      @user_address = params["address"]
      if @user_address == ""
        yelp.set_location(params[:latitude],params[:longitude])
      else
        yelp.set_address(params["address"])
      end

      @search.each do |k,v|
        yelp.set_params(v["term"], v["tag"], params["sort"])
        if @user_address == ""
          yelp.search
          @activities << yelp.results
        else
          yelp.search_by_address
          @activities << yelp.results
        end
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
