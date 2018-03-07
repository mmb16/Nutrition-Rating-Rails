class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
        t.string :name
        t.integer :restuarant_id
      t.timestamps
    end
  end
end
