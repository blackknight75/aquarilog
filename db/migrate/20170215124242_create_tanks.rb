class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name
      t.string :dimensions
      t.string :gallons
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
