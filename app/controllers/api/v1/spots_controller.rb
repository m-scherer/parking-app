class Api::V1::SpotsController < ApplicationController

  def create
    spot = Spot.new(spot_params)
    if spot.save
      render json: spot,
          status: 200
    else
      bad_request
    end
  end

  def update
    spot = Spot.find(spot_params[:id])
    if spot.update(spot_params)
      render json: spot,
          status: 200
    else
      bad_request
    end
  end

  def destroy
    render json: Spot.find(spot_params[:id]).destroy,
        status: 204
  end

  def index
    render json: Spot.all,
        status: 200
  end

  def show
    render json: Spot.find(spot_params[:id]),
        status: 200
  end

  private

    def spot_params
      params.permit(:lot_id, :number, :id, :taken)
    end

end
