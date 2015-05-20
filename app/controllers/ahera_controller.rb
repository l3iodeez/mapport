class AheraController < InternalController
 
def index

  

    @customer = current_user.customer
     @ownedbuildings = Hash.new()

    if !current_user.is_admin
     @cust_mats = current_user.customer.materials
  
      current_user.customer.buildings.each do |building|
      @ownedbuildings[building.buildingname] = building.buildingname
      end

     @materials_grid = initialize_grid(@cust_mats,
      :include => [:space, :customer, :building],
     #:conditions => {:customer => @customer},
      :name => 'materials',
      :per_page => 20,
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data',
      :custom_order => {'materials.amtdamage' => 'COALESCE(?, 0)'}
      )
  else
        @buildings = Building.all
        @buildings.each do |building|
        @ownedbuildings[building.buildingname] = building.buildingname
        end

    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 20,
      :name => 'materials',
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data',
      :custom_order => {'materials.amtdamage' => 'COALESCE(?, 0)'}
      )
    end
  export_grid_if_requested 
end

 def display_filtered

  @building = Building.all.find_by_id(params[:building_id])

  @space = @building.spaces.where(spaceid: params[:space_id]).first
        if !@space

  flash[:alert] = "No data is recorded for this space."
  redirect_to :back 

end   

  @materials = @space.materials 



      @filtered_grid = initialize_grid(@materials,
      :include => [:space, :customer, :building],
      #:conditions => {'spaces.spaceid' => params[:space_id]},
      :per_page => 20,
      :name => 'materials',
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data',
      :custom_order => {'materials.amtdamage' => 'COALESCE(?, 0)'}
      ) end
   
end
