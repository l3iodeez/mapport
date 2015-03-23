class MakeIdFieldsRequired < ActiveRecord::Migration
  def change
  	change_column :materials, :building_id, :integer, :null => false
  	change_column :materials, :customer_id, :integer, :null => false
  	change_column :materials, :space_id, :integer, :null => false
  	change_column :spaces, :building_id, :integer, :null => false
  	change_column :spaces, :customer_id, :integer, :null => false
  	change_column :buildings, :customer_id, :integer, :null => false
  	change_column :reports, :customer_id, :integer, :null => false
  	change_column :buildings, :customer_id, :integer, :null => false
  end
end
