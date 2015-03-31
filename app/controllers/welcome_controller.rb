class WelcomeController < ApplicationController
	before_action :check_changed_pass
	
def index
	
	@curruser = current_user
	@currcustomer = current_user.customer
	@customers = Customer.all
	@buildings = Building.all

	
end
  
end
