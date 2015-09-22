class CreateProfiletags < ActiveRecord::Migration
  def change
    create_table :profiletags do |t|
      t.integer :profile_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
