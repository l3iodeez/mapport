class Material < ActiveRecord::Base
belongs_to :space
belongs_to :building
belongs_to :customer



ACM_DICT = {1=> 'Sampled, ACM', 2 => 'Sampled, Non-ACM', 3 => 'Assumed ACM', 4 => 'Non-suspect material', 5 =>'No access'}

def acm_display
ACM_DICT[self.acm_category]
end

MAT_DICT = {1=> 'Thermal System Insulation', 2 => 'Surfacing', 3 => 'Miscellaneous', 4 => 'Not applicable'}

def mat
MAT_DICT[self.material_category]
end

DAM_DICT = {1=> 'Localized', 2 => 'Distributed'}

def dam
DAM_DICT[self.type_damage]
end

end
