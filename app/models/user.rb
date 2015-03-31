class User < ActiveRecord::Base
  belongs_to :customer
  #has_many :reports, through: :customer
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
after_commit :update_pass_change
after_create :dump_pass_globalvar
def update_pass_change
  self.pass_changed = true
  self.save
end
        
def dump_pass_globalvar
  $calc_pass = nil
end
   
         
  #after_create :send_admin_mail      
  
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
    
  def send_admin_mail
  #  AdminMailer.new_user_waiting_for_approval(self).deliver
  end
  
end
