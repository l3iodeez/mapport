class BuildingsController < RestrictedController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  respond_to :html

  def index
    @buildings = Building.all
    respond_with(@buildings)
  end

  def show
    respond_with(@building)
  end

  def new
    @building = Building.new
    respond_with(@building)
  end

  def edit
  end

  def create
    @building = Building.new(building_params)
    @building.save
    respond_with(@building)
  end

  def update
    @building.update(building_params)
    respond_with(@building)
  end

  def destroy
    @building.destroy
    respond_with(@building)
  end

  private
    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:buildingname, :buildingid, :street_address, :locality, :region, :postcode, :customer_id)
    end
end
