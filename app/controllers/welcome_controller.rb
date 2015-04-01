class WelcomeController < InternalController
	
	
def index
	
	@curruser = current_user
	@currcustomer = current_user.customer
	@customers = Customer.all
	@buildings = Building.all

	
end
  
end
