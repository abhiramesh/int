class AddInterestsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :interests, :text
  end
end
