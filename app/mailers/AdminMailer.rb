class AdminMailer < ActionMailer::Base
  default to: 'henry.d.dotson@gmail.com',
          from: 'notification@example.com'
 
  def new_user_waiting_for_approval(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end
