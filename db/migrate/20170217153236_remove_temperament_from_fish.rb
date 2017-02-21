class RemoveTemperamentFromFish < ActiveRecord::Migration
  def change
    remove_column :fish, :temperament, :string
  end
end
