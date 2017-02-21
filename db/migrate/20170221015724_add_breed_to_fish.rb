class AddBreedToFish < ActiveRecord::Migration
  def change
    add_reference :fish, :breed, index: true, foreign_key: true
  end
end
