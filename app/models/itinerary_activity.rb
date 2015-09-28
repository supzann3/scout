class ItineraryActivity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :activity
end
