class LotsController < ApplicationController

  def new
    @lot = Lot.new
  end

  def create
    lot = Lot.new(lot_params)
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

end
