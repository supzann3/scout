class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)

   # save list if there is a temp_list in the session
  if session[:itinerary].present?
    @itinerary = Itinerary.create(user_id:current_user.id)
    @itinerary.add_activities(session[:itinerary]["activity_ids"])
    session[:itinerary] = nil
    flash[:notice] = "Sweet, logged in. Nice Itinerary, btw :)"
    itinerary_path(@itinerary)
  else
  #if there is not temp list in the session proceed as normal
    super
  end

 end

 def lat_lng
    @lat_lng = cookies[:lat_lng].split("|") unless cookies[:lat_lng] == nil
  end

end
