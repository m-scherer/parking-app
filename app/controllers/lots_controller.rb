class LotsController < ApplicationController

  def new
    @lot = Lot.new
  end

  def create
    lot = Lot.new(merge_coordinates)
    if lot.save
      flash[:success] = "#{lot.name} successfully created"
      redirect_to lots_path
    else
      render :new
    end
  end

  def index
    @lots = Lot.all
  end

  private

  def lot_params
    params.require(:lot).permit(:name)
  end

  def get_address
    params.require(:lot).permit(:address)[:address]
  end

  def merge_coordinates
    coordinates = Location.create_location(get_address)
    lot_params.merge(lat: coordinates.lat, long: coordinates.long)
  end

end
