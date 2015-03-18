class AddMaterialCategoryToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :material_category, :integer
  end
end
