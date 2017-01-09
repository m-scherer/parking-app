class ChangeTakenColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column(:spots, :taken?, :taken)
  end
end
