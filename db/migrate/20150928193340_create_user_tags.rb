class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.references :user, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_tags, :users
    add_foreign_key :user_tags, :tags
  end
end
