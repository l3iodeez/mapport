class AddFileReferenceToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :file_reference, :string
  end
end
