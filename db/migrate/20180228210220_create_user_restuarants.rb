class CreateUserRestuarants < ActiveRecord::Migration[5.1]
  def change
    create_table :user_restuarants do |t|
        t.integer :user_id
        t.integer :restuarant_id
      t.timestamps
    end
  end
end
