class RestrictedController < InternalController
	before_action :check_admin

	    def check_admin
    	    @user = current_user
          unless @user.is_admin  #check if current user is an administrator
          redirect_to root_path, 
          alert: "You are not an admin." # boot them to the main page if not admin
    	    else
    	     # allow user to load admin only pages
          end
    end

end