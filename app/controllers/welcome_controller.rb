class WelcomeController < InternalController

before_action :check_bldg_ownership, only: [:buildingpanel]

	
def index
	
	@curruser = current_user
	@currcustomer = current_user.customer
	@customers = Customer.all
	if current_user.is_admin 
	@buildings = Building.all
	else
	@buildings = Building.all.where(customer: @currcustomer)	
	end


		 @buildings_grid = initialize_grid(@buildings,
		      :include => [:customer],
		     
		      :name => 'buildings',
		      :per_page => 10,
		      :enable_export_to_csv => false,
		      
		      )

		@hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
		  marker.lat building.latitude
		  marker.lng building.longitude
		  marker.infowindow view_context.link_to(building.buildingname, show_building_path(building.id))
		end


end


  
def buildingpanel
				@curruser = current_user
			@currcustomer = current_user.customer
			@customers = Customer.all
			if current_user.is_admin 
			@buildings = Building.all
			else
			@buildings = Building.all.where(customer: @currcustomer)	
			end
			@building = Building.all.find_by_id(params[:building_id])
			@reports = Report.where(building_id: params[:building_id])
			@floorplans = Floorplan.where(building_id: params[:building_id])

		 @reports_grid = initialize_grid(@reports,
		      :include => [:customer],
		     
		      :name => 'reports',
		      :per_page => 10,
		      :enable_export_to_csv => false,
		      
		      )
		@hash = Gmaps4rails.build_markers(@building) do |building, marker|
		  marker.lat building.latitude
		  marker.lng building.longitude
		  marker.infowindow view_context.link_to(building.buildingname, show_building_path(building.id))


		end
end

def check_bldg_ownership
	@user = current_user
	@building = Building.find_by_id(params[:building_id])
      if @user.customer_id != @building.customer_id && !current_user.is_admin #check if current user is a user tied to report's owner
         redirect_to root_path,
          alert: "You are not authorized to select this facility" # boot them to the main page if not admin
      end
end
     


end
