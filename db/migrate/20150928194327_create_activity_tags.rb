class CreateActivityTags < ActiveRecord::Migration
  def change
    create_table :activity_tags do |t|
      t.references :activity, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :activity_tags, :activities
    add_foreign_key :activity_tags, :tags
  end
end
