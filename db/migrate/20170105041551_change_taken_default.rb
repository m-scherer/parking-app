class ChangeTakenDefault < ActiveRecord::Migration[5.0]
  def change
    change_column(:spots, :taken?, :boolean, null: false, default: false)
  end
end
