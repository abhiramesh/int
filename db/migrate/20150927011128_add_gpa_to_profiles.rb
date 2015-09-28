class AddGpaToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :gpa, :float
  end
end
