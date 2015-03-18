class Space < ActiveRecord::Base
  belongs_to :customer
  belongs_to :building
  has_many :materials
end
