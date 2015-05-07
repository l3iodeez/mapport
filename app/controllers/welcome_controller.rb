class WelcomeController < InternalController
	
	
def index
	
	@curruser = current_user
	@currcustomer = current_user.customer
	@customers = Customer.all
	@buildings = Building.all


 @buildings_grid = initialize_grid(@buildings,
      :include => [:customer],
     
      :name => 'buildings',
      :per_page => 10,
      :enable_export_to_csv => false,
      
      )
	
end
  
end
