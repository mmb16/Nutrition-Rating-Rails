class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :restuarant_id
      t.integer :dish_id
      t.integer :ratings
      t.string :comments

      t.timestamps
    end
  end
end
