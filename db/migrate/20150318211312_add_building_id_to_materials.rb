class AddBuildingIdToMaterials < ActiveRecord::Migration
  def change
  	add_column :materials, :building_id, :integer
  end
end
