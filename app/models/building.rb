class Building < ActiveRecord::Base
  belongs_to :customer
  has_many :spaces
  has_many :materials
  has_many :reports

  validates_presence_of :customer_id

end
