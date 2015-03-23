class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :buildingname
      t.string :buildingid
      t.string :street_address
      t.string :locality
      t.string :region
      t.string :postcode
      t.references :customer, index: true

      t.timestamps
    end
    add_index :buildings, :buildingname, unique: true
  end
end
