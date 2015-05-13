class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.references :building, index: true
      t.integer :level
      t.attachment :image

      t.timestamps null: false
    end
    add_foreign_key :floorplans, :buildings
  end
end
