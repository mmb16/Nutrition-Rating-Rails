class DishesController < ApplicationController
    
    def new
        @dish = Dish.new
        build_ingredients(@dish, 5)
    end
    
    def index
        @dishes = Dish.all
    end

    def edit
        @dish = Dish.find(params[:id])
    end

    def create
        @dish = Dish.create(dish_params)
        require 'pry'; binding.pry
        redirect_to(@dish)
    end

    def show
        @dish = Dish.find(params[:id])
    end

    def update
        @dish = Dish.find(params[:id])
        @dish.update(dish_params)
        redirect_to(@dish)
    end

    def destroy
        @dish = Dish.find(params[:id])
        @dish.destroy
        redirect_to("/dishs")
    end

    
    
     private

    def dish_params
        params.require(:dish).permit(:name, ingredients_attributes: [:name], ingredients_ids: [])
    end
    
    def build_ingredients(dish, num)
      num.times do
        @dish.ingredients.build
      end
    end
end
