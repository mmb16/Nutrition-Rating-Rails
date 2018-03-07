class RestuarantsController < ApplicationController
    def index
        @restuarants = Restuarant.all
    end
    
    def new 
        #require 'pry'; binding.pry
        @restuarant = Restuarant.new
    end
    
    def create
       @restuarant = Restuarant.new(restuarant_params)
 
        if @restuarant.save
         redirect_to restuarant_path(@restuarant)
        else
         render :new
        end
    end
    
    def show
        @restuarant = Restuarant.find(params[:id])
    end
    
    def restuarant_params
        params.require(:restuarant).permit(:name)
    end
    
end
