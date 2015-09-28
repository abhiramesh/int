class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :firm_id
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
