class Api::V1::LotsController < ApplicationController

  def create
    lot = Lot.new(lot_params)
    if lot.save
      render json: lot,
          status: 200
    else
      bad_request
    end
  end

  def update
    lot = Lot.find(lot_params[:id])
    if lot.update(lot_params)
      render json: lot,
          status: 200
    else
      bad_request
    end
  end

  def destroy
    render json: Lot.find(lot_params[:id]).destroy,
        status: 204
  end

  def index
    render json: Lot.all,
        status: 200
  end

  def show
    render json: Lot.find(lot_params[:id]),
        status: 200
  end

  private

    def lot_params
      params.permit(:lat, :long, :name, :id)
    end

end
