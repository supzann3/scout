class ItinerariesController < ApplicationController
  def create
    @itinerary = Itinerary.create
    @yelp = YelpApi.new
    @activities = []
    tags = params["tags"]["ids"]
    tags.each do |tag|
      @yelp.set_params(tag)
      @activities << @yelp.search
      # These 2 steps should only happen if User clicks save
      # result = Activity.find_or_create_by(google_id: activity.first.id)
      # ItineraryActivity.create(itinerary_id: @itinerary.id, activity_id: result.id)
    end

    render 'show'
  end
end
