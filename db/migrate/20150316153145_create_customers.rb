class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :company
      t.string :street_address
      t.string :region
      t.string :postcode

      t.timestamps
    end
    add_index :customers, :company, unique: true
  end
end
