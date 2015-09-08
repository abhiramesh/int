class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :image
      t.string :resume
      t.string :school
      t.string :year
      t.string :major

      t.timestamps null: false
    end
  end
end
