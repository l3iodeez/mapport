class Floorplan < ActiveRecord::Base
  has_attached_file :image
  belongs_to :building
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
