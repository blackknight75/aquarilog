class AddCostToTank < ActiveRecord::Migration
  def change
    add_column :tanks, :cost, :float
  end
end
