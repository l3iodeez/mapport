class Building < ActiveRecord::Base
  belongs_to :customer
  has_many :spaces
  has_many :materials
  has_many :reports

  validates_presence_of :customer_id

  geocoded_by :full_street_address  # can also be an IP address
  after_validation :geocode

def full_street_address
  [street_address, locality, region, postcode].compact.join(', ')
end
end
