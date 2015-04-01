class InternalController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy],
  before_action :check_admin

  respond_to :html

  def index
    @spaces = Space.all
    respond_with(@spaces)
  end

  def show
    respond_with(@space)
  end

  def new
    @space = Space.new
    respond_with(@space)
  end

  def edit
  end

  def create
    @space = Space.new(space_params)
    @space.save
    respond_with(@space)
  end

  def update
    @space.update(space_params)
    respond_with(@space)
  end

  def destroy
    @space.destroy
    respond_with(@space)
  end

  private
    def set_space
      @space = Space.find(params[:id])
    end

    def space_params
      params.require(:space).permit(:spacename, :spaceid, :roomnum, :floor, :roomsqft, :building_id, :customer_id)
    end
end
