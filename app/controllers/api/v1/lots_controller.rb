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

  private

    def lot_params
      params.permit(:lat, :long, :name)
    end

end
