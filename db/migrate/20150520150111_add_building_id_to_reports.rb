class AddBuildingIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :building_id, :integer
  end
end
