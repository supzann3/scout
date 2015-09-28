class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
