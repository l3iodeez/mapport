class AddCustomerIdToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :customer_id, :integer
  end
end
