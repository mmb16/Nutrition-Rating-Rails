module ApplicationHelper
    def find_quantity(dish, ingredient)
        ri = DishIngredient.find_by(:dish_id => dish.id, :ingredient_id => ingredient.id)
        if ri
            ri.quantity
        else
            ""
        end
    end
end
