class Material < ActiveRecord::Base
belongs_to :space
belongs_to :building
belongs_to :customer
<<<<<<< HEAD
scope :customer, -> (customer) { where customer: customer}
=======
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde



ACM_DICT = {1=> 'Sampled, ACM', 2 => 'Sampled, Non-ACM', 3 => 'Assumed ACM', 4 => 'Non-suspect material', 5 =>'No access'}

def acm_display
ACM_DICT[self.acm_category]
end

MAT_DICT = {1=> 'Thermal System Insulation', 2 => 'Surfacing', 3 => 'Miscellaneous', 4 => 'Not applicable'}

def mat_type_display
MAT_DICT[self.material_category]
end

DAM_DICT = {1=> 'Localized', 2 => 'Distributed'}

def dam_type_display
DAM_DICT[self.typedamage]
end

end
