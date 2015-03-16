class AddCustomerRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :customer, index: true
  end
end
