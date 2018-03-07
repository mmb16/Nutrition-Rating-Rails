class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :protien
      t.integer :calories
      t.integer :sugar
      t.integer :fat
      t.timestamps
    end
  end
end
