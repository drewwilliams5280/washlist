class AddStatusToTruck < ActiveRecord::Migration[5.2]
  def change
    add_column :trucks, :status, :integer, :default => 0
  end
end
