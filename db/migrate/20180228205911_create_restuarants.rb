class CreateRestuarants < ActiveRecord::Migration[5.1]
  def change
    create_table :restuarants do |t|
        t.string :name

      t.timestamps
    end
  end
end
