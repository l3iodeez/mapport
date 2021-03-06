class User < ActiveRecord::Base
      
  belongs_to :customer
  #has_many :reports, through: :customer
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable


   before_save :update_password_changed


         
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

  private
   def update_password_changed
    self.pass_changed = Time.now if changed.include? 'encrypted_password'
    

  end
end
