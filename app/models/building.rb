class Building < ActiveRecord::Base
  belongs_to :customer
  has_many :spaces
  has_many :materials
  has_many :reports

  validates_presence_of :customer_id

  geocoded_by :address + " " + :locality + ", " + :region + " " + :postcode    # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

end
