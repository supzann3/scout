class CreateItineraryActivities < ActiveRecord::Migration
  def change
    create_table :itinerary_activities do |t|
      t.references :itinerary, index: true
      t.references :activity, index: true

      t.timestamps null: false
    end
    add_foreign_key :itinerary_activities, :itineraries
    add_foreign_key :itinerary_activities, :activities
  end
end
