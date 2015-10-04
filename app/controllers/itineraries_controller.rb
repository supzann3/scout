class ItinerariesController < ApplicationController

  def index
    @all=Itinerary.all
  end

  def new
  end

  def create
    if params["search"]
      yelp = YelpApi.new
      @location_array = lat_lng
      @activities = []
      @search = params["search"]["ids"]
      @user_address = params["address"]

      if @user_address == ""
        yelp.set_location(@location_array)
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
    elsif params["activity_ids"]
      if current_user.nil?
        session[:itinerary] = params
        render :js => "window.location = '#{new_user_registration_path}'"
      else
        @itinerary = Itinerary.create(name:params["name"],user_id:current_user.id)
        @itinerary.add_activities(params["activity_ids"])
        render :js => "window.location = '#{itinerary_path(@itinerary)}'"
      end
    end
  end

  def show
    @all=Itinerary.all
    @biz_info = []
    @itinerary = Itinerary.find(params[:id])
    @activities = @itinerary.activities
    yelp = YelpApi.new
    @activities.each do |act|
      yelp.business(act.google_id)
      @biz_info << yelp.results
    end
  end
end
