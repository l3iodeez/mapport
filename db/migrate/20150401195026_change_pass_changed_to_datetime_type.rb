class ChangePassChangedToDatetimeType < ActiveRecord::Migration
    def up
    remove_column :users, :pass_changed
    add_column :users, :pass_changed, :datetime
  end

  def down
    remove_column :users, :pass_changed
    add_column :users, :pass_changed, :boolean
  end
end
