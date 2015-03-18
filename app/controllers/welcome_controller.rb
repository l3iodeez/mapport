class WelcomeController < ApplicationController

  # GET /welcome
  def index
    @materials_grid = initialize_grid(Material, :include => [:space, :building, :customer] )
    
  end
end
