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
    	    flash.now[:alert] = "You are recognized as an admin." # allow user to load admin only pages
          end
    end


  
end
