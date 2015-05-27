class AdminMailer < ActionMailer::Base
  default to: 'support@mapport.com',
          from: 'support@mapport.com'
 
  def new_user_waiting_for_approval(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end
