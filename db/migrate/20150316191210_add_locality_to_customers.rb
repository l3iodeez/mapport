class AddLocalityToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :locality, :string
  end
end
