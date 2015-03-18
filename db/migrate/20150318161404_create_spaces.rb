class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :spacename
      t.string :spaceidnum
      t.string :roomnum
      t.integer :floor
      t.integer :roomsqft
      t.references :building, index: true

      t.timestamps
    end
  end
end
