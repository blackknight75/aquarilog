class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :name
      t.string :purchase_date
      t.string :purchase_store
      t.string :temperament
      t.string :breed
    end
  end
end
