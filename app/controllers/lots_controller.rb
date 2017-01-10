class LotsController < ApplicationController

  def new
    @lot = Lot.new
  end

  def create
    lot = Lot.new(merge_coordinates)
    if lot.save
      lot.create_spots(get_spots)
      flash[:success] = "#{lot.name} successfully created"
      redirect_to spots_path
    else
      render :new
    end
  end

  def edit
    @lot = Lot.find(params[:id])
  end

  def update
    lot = Lot.find(params[:id])
    if lot.update(merge_coordinates)
      lot.update_spots(get_spots)
      flash[:success] = "#{lot.name} successfully updated"
      redirect_to spots_path
    else
      render :edit
    end
  end

  private

  def lot_params
    params.require(:lot).permit(:name)
  end

  def get_address
    params.require(:lot).permit(:address)[:address]
  end

  def get_spots
    params.require(:lot).permit(:spots)[:spots].to_i
  end

  def merge_coordinates
    if get_address != ""
      coordinates = Location.create_location(get_address)
      return lot_params.merge(lat: coordinates.lat, long: coordinates.long)
    else
      lot_params
    end
  end

end
