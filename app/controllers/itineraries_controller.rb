class ItinerariesController < ApplicationController

  def index
    @all = Itinerary.all
  end

  def new
  end

  def create
    if params["search"]
      yelp = YelpApi.new
      @location_array = lat_lng
      @activities = []
      @search = params["search"]["ids"]
      @current_location = params["current_location"]
      @user_address = params["address"]
      @loc = ""
      if @current_location == "false" && @user_address != ""
        @loc = yelp.set_address(params["address"])
      else
        @loc = yelp.set_location(@location_array)
      end

      @search.each do |k,v|
        yelp.set_params(v["term"], v["tag"], params["sort"])
        @user_address == "" ? yelp.search : yelp.search_by_address
        if yelp.results == [] || yelp.results == nil
          @errors ||= []
          @errors << "'#{v["tag"].capitalize} - #{v["term"]}' returned 0 results."
        else
          @activities << yelp.results
        end
      end
    elsif params["activity_ids"]
      if current_user.nil?
        session[:itinerary] = params
        flash[:alert] = "You must be logged in to save itinerary"
        render :js => "window.location = '#{new_user_registration_path}'"
      else
        @itinerary = Itinerary.create(name:params["name"],user_id:current_user.id)
        @itinerary.add_activities(params["activity_ids"])
        render :js => "window.location = '#{itinerary_path(@itinerary)}'"
      end
    end
  end

  def show
    @biz_info = []
    @itinerary = Itinerary.find(params[:id])
    @user_itinerary=Itinerary.where(user_id:current_user.id)
    # @user_itinerary=User.find(@itinerary.user_id)
    # @user_itineraries=@user_itinerary.activities
    @activities = @itinerary.activities
    yelp = YelpApi.new
    @activities.each do |act|
      yelp.business(act.google_id)
      @biz_info << yelp.results
    end
  end
end
