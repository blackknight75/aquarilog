class AddCostToFish < ActiveRecord::Migration
  def change
    add_column :fish, :cost, :float
  end
end
