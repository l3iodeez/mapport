class Report < ActiveRecord::Base
  belongs_to :customer
<<<<<<< HEAD
  belongs_to :building
=======
<<<<<<< HEAD
  belongs_to :building
=======
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
  mount_uploader :pdf, PdfUploader 
  
  validates_presence_of :reportname, :description, :filename, :customer_id, :report_date

end
