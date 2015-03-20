class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	unless current_user.is_admin
  	 @customer = current_user.customer
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :conditions => {:customer => @customer},
      :per_page => 10,
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'

      )
	else
  	 
    @materials_grid = initialize_grid(Material,
      :include => [:space, :customer, :building],
      :per_page => 10,
      :enable_export_to_csv => true,
      :csv_file_name => 'Survey Data'
      )
  	end
   end
end
