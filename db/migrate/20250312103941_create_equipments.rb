class CreateEquipments < ActiveRecord::Migration[7.1]
  def change
    create_table :equipments do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
