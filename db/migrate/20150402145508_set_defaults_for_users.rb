class SetDefaultsForUsers < ActiveRecord::Migration
  def up
  	change_column :users, :is_admin, :boolean, :default => false
  	change_column :users, :approved, :boolean, :default => true
  	change_column :users, :pass_changed, :datetime, :default => Time.now
  end
  def down
  end
end
