class Report < ActiveRecord::Base
  belongs_to :customer
  belongs_to :building
  mount_uploader :pdf, ReportsUploader 
  
  validates_presence_of :reportname, :description, :filename, :customer_id, :report_date, :building_id

end
