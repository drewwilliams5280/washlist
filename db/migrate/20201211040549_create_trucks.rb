class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :unit_number
      t.integer :unit_type

      t.timestamps
    end
  end
end
