class AddDamageFieldsToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :removed, :boolean
    add_column :materials, :amtdamage, :float
    add_column :materials, :typedamage, :integer
  end
end
