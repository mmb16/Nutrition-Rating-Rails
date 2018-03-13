class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @visited_restuarants = @user.visited_restuarants
        @owned_restuarants = @user.owned_restuarants
        #require 'pry'; binding.pry
    end
    
    def edit
        @user = User.find(params[:id])
        #@user.save
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
    private

  def user_params
    params.require(:user).permit(:username, :phone_number, :birthday)
  end
end
