class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :reportname
      t.text :description
      t.string :filename
      t.references :customer, index: true
      t.date :report_date

      t.timestamps
    end
    add_index :reports, :reportname, unique: true
    add_index :reports, :filename, unique: true
  end
end
