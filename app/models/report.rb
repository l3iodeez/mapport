class Report < ActiveRecord::Base
  belongs_to :customer
<<<<<<< HEAD
  belongs_to :building
=======
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
  mount_uploader :pdf, PdfUploader 
  
  validates_presence_of :reportname, :description, :filename, :customer_id, :report_date

end
