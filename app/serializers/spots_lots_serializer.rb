class SpotsLotsSerializer < ActiveModel::Serializer
  attributes :spot, :lot

  def lot
    object.lot
  end

  def spot
    object
  end

end
