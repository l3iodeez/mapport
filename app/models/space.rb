class Space < ActiveRecord::Base
  belongs_to :customer
  belongs_to :building
  has_many :materials
  validates_presence_of :customer_id, :building_id
end
