class AddCustomerIdToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :customer_id, :integer
  end
end
