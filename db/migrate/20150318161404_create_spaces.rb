class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :spacename
<<<<<<< HEAD
      t.string :spaceid
=======
      t.string :spaceidnum
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
      t.string :roomnum
      t.integer :floor
      t.integer :roomsqft
      t.references :building, index: true

      t.timestamps
    end
  end
end
