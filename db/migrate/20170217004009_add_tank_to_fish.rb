class AddTankToFish < ActiveRecord::Migration
  def change
    add_reference :fish, :tank, index: true, foreign_key: true
  end
end
