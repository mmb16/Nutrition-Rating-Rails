class Dish < ApplicationRecord
    belongs_to :restuarant
    has_many :dish_ingredients
    has_many :ingredients, through: :dish_ingredients
    validates :name, presence: true
    validates :name, uniqueness: true
    
    
    
    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.each do |key, value|

            ## if value["name"] is blank, don't do anything
            ## on this iteration
            if !value["name"].blank?

                ## if no ingredient id (value["id"]) is present, we know we're creating and not editing
                ## our first check can't just be by name because if we're in edit mode,
                ## the name might be different because we might have changed it
                ## so first we check if the id is present,
                ## if not we check if the ingredient was already created by another dish
                ## if neither of those are true we make a brand new ingredient
                ingredient = Ingredient.find_by(:id => value["id"]) ||
                             Ingredient.find_by(:name => value["name"]) ||
                             Ingredient.new

                ## in any case it is safe to assign the params 'name' to this ingredient
                ingredient.name = value["name"]
                ingredient.save

                ## if the relationship between the dish already exists,
                ## we don't want to make a new join table, we want to edit
                ## the existing one
                join = DishIngredient.find_or_create_by(
                    :dish_id => self.id,
                    :ingredient_id => ingredient.id
                    )
                join.quantity = value["quantity"]
                join.dish = self
                join.save
            end
        end
    end

    def existing_ingredients=(existing_ingredients)
      ## this method handles adding the existing ingredients with
      ## quantities in the select-field area
      
        ingredient_objects = existing_ingredients
        ingredient_objects.each do |i, ingredient_object|
            if ingredient_object["id"] != ""
               ingredient = Ingredient.find(ingredient_object["id"])
               if !self.ingredients.include?(ingredient)
                self.dish_ingredients.build(
                    :quantity => ingredient_object["quantity"],
                    :ingredient_id => ingredient_object["id"],
                    :dish_id => self.id
                    )
               end
            end
        end
    end

end
