class Customer < ActiveRecord::Base
has_many :reports
has_many :users
has_many :buildings
has_many :spaces
end
