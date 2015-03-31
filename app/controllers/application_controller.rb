class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :error, :failure
  protect_from_forgery with: :exception
  before_action :authenticate_user!
 
    def check_admin
    	    @user = current_user
          unless @user.is_admin  #check if current user is an administrator
          redirect_to root_path, 
          alert: "You are not an admin." # boot them to the main page if not admin
    	    else
    	     # allow user to load admin only pages
          end
    end

  def check_changed_pass
  @user = current_user
    unless@user.pass_changed
      redirect_to edit_user_registration_path,
      alert: "You must change your password before logging in for the first time"
    end
  end
end
