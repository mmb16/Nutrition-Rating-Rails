class AddQuantityToDishIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :dish_ingredients, :quantity, :integer
  end
end
