class WelcomeController < ApplicationController

  # GET /welcome
  def index
<<<<<<< HEAD
    @customer = current_user.customer
     @ownedbuildings = Hash.new()

  	if !current_user.is_admin
  	 cust_mats = current_user.customer.materials
  
      current_user.customer.buildings.each do |building|
      @ownedbuildings[building.buildingname] = building.buildingname
      end

     @materials_grid = initialize_grid(cust_mats,
      :include => [:space, :customer, :building],
      :conditions => {:customer => @customer},
      :name => 'materials',
      :per_page => 10,
=======
  	unless current_user.is_admin
  	 @customer = current_user.customer
  	 cust_mats = current_user.customer.materials

    @materials_grid = initialize_grid(cust_mats,
      :include => [:space, :customer, :building],
      :conditions => {:customer => @customer},
      :per_page => 15,
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'

      )
	else
<<<<<<< HEAD
        @buildings = Building.all
  	    @buildings.each do |building|
        @ownedbuildings[building.buildingname] = building.buildingname
        end

    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 10,
      :name => 'materials',
=======
  	 
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 15,
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'
      )
  	end
<<<<<<< HEAD
export_grid_if_requested
   end
   
=======
   end
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
end
