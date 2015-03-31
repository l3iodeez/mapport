class AddPassChangedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pass_changed, :boolean
  end
end
