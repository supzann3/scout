class UsersController < ApplicationController
  def show
    @user_itinerary=Itinerary.where(user_id:current_user.id)
  end
end
