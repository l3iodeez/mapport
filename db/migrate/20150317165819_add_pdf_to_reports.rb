class AddPdfToReports < ActiveRecord::Migration
  def change
    add_column :reports, :pdf, :string
  end
end
