class AddLongLatToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :longitude, :decimal, {:precision=>10, :scale=>6}
    add_column :buildings, :lattitude, :decimal, {:precision=>10, :scale=>6}
  end
end
