class Itinerary < ActiveRecord::Base
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
  has_many :tags, through: :activities
  belongs_to :user

  def add_activities(activities)
    activities.each do |activity|
      result = Activity.find_or_create_by(google_id: activity)
      ItineraryActivity.create(itinerary_id: self.id, activity_id: result.id)
    end
  end

  def self.google_map(places)
    Gmaps4rails.build_markers(places) do |activity, marker|
      marker.lat activity.location.coordinate.latitude
      marker.lng activity.location.coordinate.longitude
    end
  end
end
