class WelcomeController < ApplicationController

  # GET /welcome
  def index
<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
    @customer = current_user.customer
     @ownedbuildings = Hash.new()

  	if !current_user.is_admin
<<<<<<< HEAD
=======
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
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
  	 cust_mats = current_user.customer.materials
  
      current_user.customer.buildings.each do |building|
      @ownedbuildings[building.buildingname] = building.buildingname
      end

     @materials_grid = initialize_grid(cust_mats,
      :include => [:space, :customer, :building],
      :conditions => {:customer => @customer},
<<<<<<< HEAD
      :name => 'materials',
      :per_page => 10,
=======
      :per_page => 15,
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'

      )
	else
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
        @buildings = Building.all
  	    @buildings.each do |building|
        @ownedbuildings[building.buildingname] = building.buildingname
        end

<<<<<<< HEAD
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 10,
      :name => 'materials',
=======
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 10,
      :name => 'materials',
=======
  	 
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 15,
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'
      )
  	end
<<<<<<< HEAD
export_grid_if_requested
   end
   
=======
<<<<<<< HEAD
export_grid_if_requested
   end
   
=======
   end
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
>>>>>>> 350f1cd7fd86062e263e564a0c6d22fcabf89614
end
