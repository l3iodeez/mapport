class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :space_id
      t.string :materialtype
      t.string :color, limit: 10
      t.string :hanum, limit: 15
      t.integer :acm_category
      t.integer :numsamp
      t.integer :sqft
      t.integer :batchnum
      t.text :comments

      t.timestamps
    end
  end
end
