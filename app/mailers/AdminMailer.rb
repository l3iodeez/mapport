class AdminMailer < ActionMailer::Base
  default to: 'support@nyenvironmental.com',
          from: 'support@nyenvironmental.com'
 
  def new_user_waiting_for_approval(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end
