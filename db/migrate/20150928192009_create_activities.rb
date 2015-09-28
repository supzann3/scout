class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.string :google_id

      t.timestamps null: false
    end
  end
end
