class User < ActiveRecord::Base
  belongs_to :customer
  #has_many :reports, through: :customer
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

after_create :dump_pass_globalvar
before_save :update_pass_change


def update_pass_change # records that  the user has changed their password
  
  while $user.pass_changed != $user.created_at
  $user.pass_changed = Time.now
  $user.save
  end
 # redirect_to 'root_path', alert: 'Password changed'
  
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
