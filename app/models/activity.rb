class Activity < ActiveRecord::Base
  has_many :itinerary_activities
  has_many :itineraries, through: :itinerary_activities
  has_many :tags, through: :activity_tags
  has_many :activity_tags
  before_initialize :run

  def run
    @yelp = YelpApi.new
  end
end
