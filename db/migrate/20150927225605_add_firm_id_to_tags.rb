class AddFirmIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :firm_id, :integer
  end
end
