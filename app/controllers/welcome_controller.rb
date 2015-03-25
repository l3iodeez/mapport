class WelcomeController < ApplicationController
def index
	
	@user = current_user
	@customer = @user.customer
	
end
  
end
