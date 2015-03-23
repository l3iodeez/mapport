class WelcomeController < ApplicationController

  # GET /welcome
  def index

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
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'

      )
  else
        @buildings = Building.all
        @buildings.each do |building|
        @ownedbuildings[building.buildingname] = building.buildingname
        end

    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 10,
      :name => 'materials',
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'
      )
    end
export_grid_if_requested
   end
   
end
