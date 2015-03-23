class ChangeAmtdamageToDecimal < ActiveRecord::Migration
 
  def up
    change_column :materials, :amtdamage, :decimal, :precision => 3, :scale => 2
  end

  def down
    change_column :materials, :amtdamage, :float
  end

end
