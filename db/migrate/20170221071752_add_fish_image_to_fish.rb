class AddFishImageToFish < ActiveRecord::Migration
  def change
    add_column :fish, :fish_image, :string
  end
end
