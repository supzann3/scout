class Itinerary < ActiveRecord::Base
  has_many :itinerary_activities
  has_many :activities, through: :itinerary_activities
  has_many :tags, through: :activities
  belongs_to :user
end
