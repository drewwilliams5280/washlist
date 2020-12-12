class AddSortToTruck < ActiveRecord::Migration[5.2]
  def change
    add_column :trucks, :sort, :integer
  end
end
