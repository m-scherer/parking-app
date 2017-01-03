class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.float :lat
      t.float :long
      t.string :name

      t.timestamps
    end
  end
end
