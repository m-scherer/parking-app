class Api::V1::SpotsController < ApplicationController

  def create
    spot = Spot.new(spot_params)
    if spot.save
      render json: spot
    else
      bad_request
    end
  end

  def update
    spot = Spot.find(spot_params[:id])
    if spot.update(spot_params)
      render json: spot
    else
      bad_request
    end
  end

  private

  def spot_params
    params.permit(:lot_id, :number, :id, :taken)
  end

  def bad_request
    render json: {error: 'not acceptable'}.to_json, status: 406
  end

end
