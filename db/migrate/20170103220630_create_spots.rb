class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.boolean :taken?
      t.references :lot, foreign_key: true

      t.timestamps
    end
  end
end
