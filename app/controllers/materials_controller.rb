class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, :check_changed_pass

  respond_to :html



  def index
    @materials = Material.all
    respond_with(@materials)
  end

  def show
    respond_with(@material)
  end

  def new
    @material = Material.new
    respond_with(@material)
  end

  def edit
  end

  def create
    @material = Material.new(material_params)
    @material.save
    respond_with(@material)
  end

  def update
    @material.update(material_params)
    respond_with(@material)
  end

  def destroy
    @material.destroy
    respond_with(@material)
  end

  private
    def set_material
      @material = Material.find(params[:id])
    end

    def material_params
      params.require(:material).permit(:materialtype, :color, :hanum, :acm_category, 
                                       :numsamp, :sqft, :batchnum, :comments, :material_category, 
                                       :removed, :amtdamage, :typedamage, :file_reference, :building_id, :customer_id, :acm_display, :amt_damage_display)
    end
end
