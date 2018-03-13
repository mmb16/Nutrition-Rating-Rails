class RestuarantsController < ApplicationController
   before_action :find_restuarant, only: [:show, :visit]
   
   
    def index
        @restuarants = Restuarant.all
    end
    
    def new 
        @owner_id = User.find(params[:user_id])
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
        #@user = User.find(params[:user_id])
        @restuarant = Restuarant.find(params[:id])
        #require 'pry'; binding.pry
    end
    
    def visit
        require 'pry'; binding.pry
         @restuarant.add_visitor(current_user)
    end
    private
    def find_restuarant
       @restuarant = Restuarant.find(params[:id]) 
    end
    
    
    
    def restuarant_params
        params.require(:restuarant).permit(:name, :owner_id)
    end
    
end
