class AddVisitsToUserRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :user_restuarants, :visits, :integer
  end
end
